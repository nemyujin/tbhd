//
//  PlaceView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/04.
//

import SwiftUI
import MapKit
import FirebaseFirestore

struct PlaceView: View {
    @State private var selectedDate = Date() // 기본값 설정
    @State private var isAddingLocation = false //장소 추가
    @State private var isAddingPlace = false//일정에 넣기 반대
    @State private var isAddingSpot = false //Day 있없
    @State private var isAddingPlaceSheetPresented = false //장소추가
    @ObservedObject var spotViewModel = SpotViewModel() // SpotViewModel 생성
    @State private var currentPage = 0 // 현재 페이지 번호를 추적하는 변수
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedSpot: Spot?
    @ObservedObject var scheduleListViewModel = ScheduleListViewModel()


    var body: some View {
        NavigationView {
            //카메라,생카투어,0개의 장소
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Image(systemName: "camera.fill")
                        .font(Font.custom("SF Pro Display", size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .frame(width: 73,height: 73)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(8)
                    Spacer()
                        .frame(width: 12)
                    VStack(alignment: .leading,spacing: 4){
                        Text("지민 생카투어")
                            .font(Font.custom("SF Pro", size: 20))
                            .foregroundColor(Color.black)
                        Text("0개의 장소")
                          .font(Font.custom("SF Pro", size: 18))
                          .foregroundColor(Color.black.opacity(0.5))
                    }
                    .padding(.trailing,150)
                    .frame(width:265,height: 73)
                }
                .frame(width:390,height: 73)
                .padding(.horizontal,20)
                HStack(spacing:180
                ){
                        //달력
                        HStack{
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
                            
                            
                            var dateFormatter: DateFormatter {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "yyyy-MM-dd"
                                return formatter
                                
                            }
                        }
                        .frame(width: 130,height: 86)
                        
                        HStack{
                            //핑,부산
                            Image(systemName: "mappin")
                                .font(
                                    Font.custom("SF Pro Display", size: 13)
                                        .weight(.semibold)
                                )
                                .kerning(0.5)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color.black.opacity(0.5))
                            Text("부산")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.semibold)
                                )
                                .kerning(0.5)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color.black.opacity(0.5))
                        }
                        .frame(width: 54,height: 86)
                    
                        
                }
                .frame(width: 390,height: 86)
                .padding(.horizontal,20)
                //장소를 추가한 화면
                if isAddingLocation {
                    
                    TabView(selection: $currentPage){
                        ForEach(0..<4, id: \.self) { _ in
                            VStack{
                                Text("Day \(currentPage + 1)")
                                                       .font(
                                                           Font.custom("SF Pro", size: 24)
                                                               .weight(.semibold)
                                                       )
                                                       .kerning(0.096)
                                                       .foregroundColor(Color.black)
                                                       .offset(x: -120, y: -20) // 페이지 번호를 조정하여 위로 이동
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 350, height: 298)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .cornerRadius(20)
                                        .padding(.leading,40)
                                    if isAddingPlace {
                                        ForEach(scheduleListViewModel.schedules, id: \.id) {schedule in
                                            VStack(alignment: .leading) {
                                                Text(schedule.name)
                                                    .font(.title2)
                                                Text(schedule.address)
                                                    .font(.headline)
                                            }
                                        }
                                        .onAppear {
                                            // Firestore에서 스케줄을 가져옵니다.
                                            scheduleListViewModel.fetchSchedules()
                                            // Firestore에서 데이터가 있으면 isAddingLocation을 true로 설정

                                                    Task {
                                                        await scheduleListViewModel.fetchSchedules()
                                                        // Firestore에서 데이터가 있으면 isAddingLocation을 true로 설정
                                                        isAddingLocation = !scheduleListViewModel.schedules.isEmpty
                                                    }

                                        }

                                    } else {
                                        //+버튼, 2023년, 편집
                                            //플러스버튼
                                            Button(action: {
                                                isAddingSpot.toggle() // 버튼을 누를 때마다 sheet를 열거나 닫습니다.
                                            })
                                        {
                                            HStack(alignment: .center, spacing: 10){
                                                Image(systemName: "plus.app.fill")
                                                    .font(
                                                        Font.custom("SF Pro", size: 30)
                                                            .weight(.semibold)
                                                    )
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(Color(red: 0.04, green: 0.52, blue: 1))
                                                    .frame(width: 28, height: 28, alignment: .center)
                                                Text("일정에 넣기")
                                                  .font(Font.custom("SF Pro", size: 17))
                                                  .foregroundColor(Color.white)
                                            }
                                            .padding(.leading,30)
                                        }
                                            .sheet(isPresented: $isAddingSpot) {
                                                ListView()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .tabViewStyle(.page)
                    
                } 
                
                else //장소를 추가하지 않은 화면
                //장소추가 버튼
                {
                    // "장소 추가" 버튼
                    Button(action: {
                        isAddingPlaceSheetPresented.toggle()
                    }) {
                        //플러스 버튼,장소추가
                        HStack(alignment: .center, spacing: 4){
                            //플러스 버튼
                            Image(systemName: "plus.app.fill")
                                .font(
                                    Font.custom("SF Pro", size: 24)
                                        .weight(.semibold)
                                )
                          
                                .foregroundColor(Color(red: 0.04, green: 0.52, blue: 1))
                                .frame(width: 28, height: 28)
                            
                            //도시추가
                            Text("장소추가")
                                .font(Font.custom("SF Pro", size: 20))
                                .foregroundColor(.black)
                                .frame(width: 82, height: 19)
                        }
                        .frame(width: 390, height: 200)
                        .padding(.leading,20)
                    }
                    .sheet(isPresented: $isAddingPlaceSheetPresented) 
                    {
                        // "장소 추가" 버튼을 눌렀을 때 표시할 뷰 (AddPlaceView)
                       ListView()
                    }
                }
                
                
            }
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill") // 원하는 이미지 사용
                            .font(.title2)
                         .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.2))
                    }
                }
            })
        }
    }
}

