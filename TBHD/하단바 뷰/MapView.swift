//
//  MapView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/11.
//

import SwiftUI
import MapKit

struct MapView: View {
    struct Annotation: Identifiable {
        let id = UUID().uuidString
        var name: String
        var address: String
        var coordinate: CLLocationCoordinate2D
    }

    @EnvironmentObject var scheduleListViewModel: ScheduleListViewModel
    @EnvironmentObject var locationManager: LocationManager
    @State private var mapRegion = MKCoordinateRegion()
    @State private var annotations: [Annotation] = []
    @Environment(\.dismiss) private var dismiss
    let regionSize = 10000.0 // meters

    var body: some View {
        VStack {
            Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: annotations) { annotation in
                MapMarker(coordinate: annotation.coordinate)
            }

            Spacer()
        }
        .onAppear() {
            updateMapRegion()
        }
        .onChange(of: scheduleListViewModel.schedules) { newSchedules in
            updateAnnotations()
            updateMapRegion()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func updateAnnotations() {
        annotations = scheduleListViewModel.schedules.map { schedule in
            Annotation(name: schedule.name, address: schedule.address, coordinate: schedule.coordinate)
        }
    }

    private func updateMapRegion() {
        if let firstSchedule = scheduleListViewModel.schedules.first {
            let coordinates = scheduleListViewModel.schedules.map { $0.coordinate }

            // Find the minimum and maximum latitude and longitude
            let minLatitude = coordinates.min { $0.latitude < $1.latitude }?.latitude ?? firstSchedule.coordinate.latitude
            let maxLatitude = coordinates.max { $0.latitude < $1.latitude }?.latitude ?? firstSchedule.coordinate.latitude
            let minLongitude = coordinates.min { $0.longitude < $1.longitude }?.longitude ?? firstSchedule.coordinate.longitude
            let maxLongitude = coordinates.max { $0.longitude < $1.longitude }?.longitude ?? firstSchedule.coordinate.longitude

            // Calculate the center and span of the region
            let center = CLLocationCoordinate2D(latitude: (minLatitude + maxLatitude) / 2, longitude: (minLongitude + maxLongitude) / 2)
            let span = MKCoordinateSpan(latitudeDelta: maxLatitude - minLatitude, longitudeDelta: maxLongitude - minLongitude)

            // Create the bounding box region
            let boundingBox = MKCoordinateRegion(center: center, span: span)
            mapRegion = boundingBox
        } else {
            Task {
                mapRegion = MKCoordinateRegion(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: regionSize, longitudinalMeters: regionSize)
            }
        }
    }


}

#Preview {
    NavigationStack{
        SpotDetailView(spot: Spot())
            .environmentObject(SpotViewModel())
            .environmentObject(LocationManager())
            .environmentObject(ScheduleListViewModel()) // Add ScheduleListViewModel to the environment
    }
}
