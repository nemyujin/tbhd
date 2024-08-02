//
//  SpotDetailView.swift
//  FirebasePractice
//
//  Created by tbhd on 2023/10/05.
//

import SwiftUI
import MapKit

struct SpotDetailView: View {
    struct Annotation: Identifiable {
        let id = UUID().uuidString
        var name: String
        var address: String
        var coordinate: CLLocationCoordinate2D
    }
    @EnvironmentObject var spotVM: SpotViewModel
    @EnvironmentObject var locationManager: LocationManager
    @State var spot: Spot
    @State private var showPlaceLookupSheet = false
    @State private var mapRegion = MKCoordinateRegion()
    @State private var annotations: [Annotation] = []
    @Environment(\.dismiss) private var dismiss
    let regionSize = 10000.0 //meters

    
    var body: some View {
        VStack {
            Group {
                TextField("Name", text: $spot.name)
                    .font(.title)
                TextField("Address", text: $spot.address)
                    .font(.title2)
            }
            .disabled(spot.id == nil ? false : true)
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: spot.id == nil ? 2:0)
            }
            .padding(.horizontal)
            
            Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: annotations) {
                annotation in MapMarker(coordinate: annotation.coordinate)
            }
            .onChange(of: spot) { _ in
                annotations = [Annotation(name: spot.name, address: spot.address, coordinate: spot.coordinate)]
                mapRegion.center = spot.coordinate
            }
            
            Spacer()
        }
        .onAppear() {
            if spot.id != nil { //if we have a spot, center map on the spot
                mapRegion = MKCoordinateRegion(center: spot.coordinate , latitudinalMeters: regionSize, longitudinalMeters: regionSize)
            } else { // otherwise center the map on the device location
                Task { //if you don't embed in a Task, the map update likely won't show
                    mapRegion = MKCoordinateRegion(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: regionSize, longitudinalMeters: regionSize)
                }
            }

            
            annotations = [Annotation(name: spot.name, address: spot.address, coordinate: spot.coordinate)]
            // 디버깅 출력 추가
               print("Annotations:", annotations)
               
               // 디버깅 출력 추가
               print("Spot Coordinate:", spot.coordinate)

        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(spot.id == nil)
        .toolbar {
            if spot.id == nil {
                ToolbarItem(placement: .cancellationAction)
                {
                    Button("Cancel")
                    {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button("Save")
                    {
                        Task {
                            let success = await spotVM.saveSpot(spot: spot)
                            if success {
                                dismiss()
                            } else {
                                print("Error saving spot!")
                            }
                        }
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .bottomBar)
                {
                    Button {
                        showPlaceLookupSheet.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                        Text("장소 찾기")
                    }
                }
            }
        }
        .sheet(isPresented: $showPlaceLookupSheet) {
            PlaceAddView(spot: $spot, annotations: $annotations)
        }
        .frame( height: 650)
    }
}

#Preview {
    NavigationStack{
        SpotDetailView(spot: Spot())
            .environmentObject(SpotViewModel())
            .environmentObject(LocationManager())
    }
}
