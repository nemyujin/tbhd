//
//  PlaceViewModel.swift
//  PlaceLookup
//
//  Created by tbhd on 2023/10/17.
//
import Foundation
import MapKit

@MainActor
class PlaceViewModel: ObservableObject {
    @Published var places: [Place] = []
    
    func search(text: String, region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text

        let koreaCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 36.7783, longitude: 127.6328),
            span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        )
        searchRequest.region = koreaCoordinateRegion

        let search = MKLocalSearch(request: searchRequest)


        search.start { response, error in
            guard let response = response else {
                print("ERROR: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            
            self.places = response.mapItems.map(Place.init)
        }
    }
}



