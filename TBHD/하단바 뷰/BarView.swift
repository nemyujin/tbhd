//
//  BarView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/03.
//

import SwiftUI

struct BarView: View {
    @State private var selectedTab = 0
    @StateObject private var spotViewModel = SpotViewModel() // SpotViewModel을 생성

    var body: some View {
        TabView(selection: $selectedTab) {
            // 첫 번째 탭
            MainBarView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
                .tag(0)
            
            // 두 번째 탭
            ExploreView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("장소찾기")
                }
                .tag(1)
            
            // 세 번째 탭
            TravelPractice()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("여행일정")
                }
                .tag(2)
            // 네 번째 탭
            ListView()
                .tabItem {
                    Image(systemName: "tray.full.fill")
                    Text("사물함")
                }
                .tag(3)
        }
        //탭바 아이콘,폰트 색상
        .accentColor(Color(red: 0.82, green: 0.53, blue: 1))
               
    }
  }

#Preview {
    BarView()
}
