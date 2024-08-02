//
//  Place.swift
//  PlaceLookup
//
//  Created by tbhd on 2023/10/16.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID().uuidString
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var name: String {
        self.mapItem.name ?? ""
    }
    var address: String {
        let placemark = self.mapItem.placemark
        var cityAndState = ""
        var address = ""
        
        cityAndState = placemark.locality ?? "" //city
        if let state = placemark.administrativeArea {
            cityAndState = cityAndState.isEmpty ? state : "\(cityAndState), \(state)"
        }
        address = placemark.subThoroughfare ?? "" // address #
        if let street = placemark.thoroughfare {
            // Just show the street unless there is a street # then add space + street
            address = address.isEmpty ? street : "\(address) \(street)"
        }
        if address.trimmingCharacters(in: .whitespaces).isEmpty && !cityAndState.isEmpty {
            // No adderess? Then just cityAndState with no space
            address = cityAndState
        } else {
            // No cityAndState? Then just address, otherwise address, cityAndState
            address = cityAndState.isEmpty ? address : "\(address), \(cityAndState)"
        }
        return address
    }
    
    var latitude: CLLocationDegrees {
        self.mapItem.placemark.coordinate.latitude
    }
    
    var longitude: CLLocationDegrees {
        self.mapItem.placemark.coordinate.longitude
    }
}
