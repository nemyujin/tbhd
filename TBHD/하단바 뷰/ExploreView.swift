//
//  ExploreView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/02.
//

import SwiftUI
import MapKit

struct ExploreView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var searchText = ""
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                .onAppear {
                    // Center the map on the initial location
                    if let initialLocation = locationManager.location {
                        locationManager.region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                    }
                }
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 320, height: 38)
                .background(Color.white)
                .cornerRadius(7)
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                    .frame(width: 28, height: 28)
                
                Text("지역, 최애를 검색해보세요.")
                    .font(
                        Font.custom("Pretendard", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(Color.gray)
                    .frame(width: 188.4706, alignment: .topLeading)
                
                Image(systemName: "slider.horizontal.3")
                    .frame(width: 28, height: 28)
            }
            
        }
    }
}

#Preview {
    ExploreView()
}
