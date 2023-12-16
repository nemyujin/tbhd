//
//  TravelListView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/04.
//

import SwiftUI
import MapKit
import CoreLocation


struct TravelListView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var scheduleListViewModel: ScheduleListViewModel
    @StateObject private var locationManager = LocationManager()
    @State private var isSheetPresented: Bool

    init() {
        _isSheetPresented = State(initialValue: true)
    }

    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // 뷰가 나타날 때 시트를 표시합니다.
                isSheetPresented = true
                // Firestore에서 스케줄을 가져옵니다.
                scheduleListViewModel.fetchSchedules()
            }
            .environmentObject(locationManager)
            .environmentObject(scheduleListViewModel)
        
            .sheet(isPresented: $isSheetPresented) {
                if scheduleListViewModel.schedules.isEmpty {
                    EmptyLocationView()
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                } else {
                    ListAddPracticeView(scheduleListViewModel: scheduleListViewModel)
                        
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                }
                
            }
    }
}

#Preview {
    TravelListView()
        .environmentObject(ScheduleListViewModel())
}
