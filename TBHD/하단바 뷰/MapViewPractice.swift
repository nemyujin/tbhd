//
//  MapViewPractice.swift
//  TBHD
//
//  Created by tbhd on 2023/11/15.
//

import SwiftUI
import MapKit

struct MapViewPractice: View {
    @EnvironmentObject var locationManager: LocationManager
    @State var returnedPlace = Place(mapItem: MKMapItem())
    var body: some View {
        
        Text("Returned place: \nName: \(returnedPlace.name)\n\(returnedPlace.address)\nCoords:\(returnedPlace.latitude),\(returnedPlace.longitude)")
    }
}

#Preview {
    MapViewPractice()
}
