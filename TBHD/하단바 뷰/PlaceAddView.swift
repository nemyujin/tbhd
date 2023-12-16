//
//  PlaceAddView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/05.
//

import SwiftUI
import MapKit

struct PlaceAddView: View {
    @EnvironmentObject var spotVM: SpotViewModel
    @State private var isSheetPresented = false
    @State private var searchText = "" // 검색창
    @State private var isSearching = false
    @EnvironmentObject var locationManager: LocationManager
    @StateObject var placeVM = PlaceViewModel()
    @Binding var spot: Spot
    @Environment(\.dismiss) private var dismiss
    @State private var isSearchActive = false // 검색 활성 상태 변수
    @State private var isShowingSpotDetailView = false // SpotDetailView를 표시할지 여부를 제어하는 변수
    @Binding var annotations: [SpotDetailView.Annotation]

    var body: some View {
        NavigationView {
            VStack {
                // 검색창
                List(placeVM.places) { place in
                    VStack(alignment: .leading) {
                        Text(place.name)
                            .font(.title2)
                        Text(place.address)
                            .font(.callout)
                        
                        
                    }
                    .onTapGesture {
                        // Spot 객체의 속성을 직접 업데이트
                        spot.name = place.name
                        spot.address = place.address
                        spot.latitude = place.latitude
                        spot.longitude = place.longitude
                        
                        annotations = [SpotDetailView.Annotation(name: place.name, address: place.address, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude))]


                        
                        dismiss()
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { text in
                    if !text.isEmpty {
                        placeVM.search(text: text, region: locationManager.region)
                    } else {
                        placeVM.places = []
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button("Dismiss") {
                            dismiss()
                        }
                    }
                }
                .navigationBarItems(leading: Text("장소찾기").fontWeight(.semibold).font(.title3))
                .ignoresSafeArea(.keyboard)
            }
        }
    }
}

#Preview {
    PlaceAddView(spot: .constant(Spot()), annotations: .constant([]))
        .environmentObject(LocationManager())
}
