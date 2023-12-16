//
//  ListAddPracticeView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/14.
//

import SwiftUI
import FirebaseFirestore
import MapKit

struct ListAddPracticeView: View {
    @State private var selectedDate = Date() // 기본값 설정
    @ObservedObject var scheduleListViewModel: ScheduleListViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var currentPage = 0 // 현재 페이지 번호를 추적하는 변수
    @ObservedObject var travelDetailViewModel: TravelDetailViewModel

    init(scheduleListViewModel: ScheduleListViewModel) {
        self.scheduleListViewModel = scheduleListViewModel
        self._travelDetailViewModel = ObservedObject(initialValue: TravelDetailViewModel())
    }


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
                
                    
                //장소 추가 버튼
                NavigationLink(destination: ListView()) {
                    HStack(alignment: .center, spacing: 10)
                    {
                        Image(systemName: "plus.app.fill")
                            .font(
                                Font.custom("SF Pro", size: 24)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.04, green: 0.52, blue: 1))
                            .frame(width: 28, height: 28, alignment: .center)
                        
                        VStack(alignment: .leading, spacing: 0)
                        {
                            Text("장소추가")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(Color.black)
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 12)
                        .padding(.bottom, 13)
                        
                        Spacer()
                            .frame(width: 120)

                    }
                    .padding(.leading,40)
                    .frame(width: 390, alignment: .center)
                    
                        
                    }
                    
                        
                }
                .frame(width: 390,height: 86)
                .padding(.horizontal,20)

                    ScrollView{
                        List{
                            ForEach(scheduleListViewModel.schedules) { schedule in
                                VStack(alignment: .leading) {
                                    Text(schedule.name)
                                        .font(.title2)
                                    Text(schedule.address)
                                        .font(.headline)
                                    HStack {
                                        Button(action: {
                                            // 버튼을 누른 장소의 정보를 가져옵니다.
                                            let selectedName = schedule.name
                                            let selectedAddress = schedule.address
                                            let selectedLatitude = schedule.latitude
                                            let selectedLongitude = schedule.longitude
                                            
                                            // Create a placemark for the selected location
                                            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: selectedLatitude, longitude: selectedLongitude), addressDictionary: nil)
                                            
                                            // Create a map item using the placemark
                                            let mapItem = MKMapItem(placemark: placemark)
                                            
                                            // Set the name of the location for better user experience in Apple Maps
                                            mapItem.name = selectedName
                                            
                                            // Open Apple Maps with the selected location
                                            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
                                        }) {
                                            Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                                                .font(Font.custom("SF Pro Display", size: 22)
                                                    .weight(.semibold))
                                                .multilineTextAlignment(.trailing)
                                                .foregroundColor(Color.black.opacity(0.9))
                                        }
                                    }
        
                                }
                            }
                            .onDelete { indexSet in
                                scheduleListViewModel.delete(atOffsets: indexSet)
                            }
                            .onMove { indices, newOffset in
                                        scheduleListViewModel.move(fromOffsets: indices, toOffset: newOffset)
                                    }
                        }
                        .onAppear {
                            // Firestore에서 스케줄을 가져옵니다.
                            scheduleListViewModel.fetchSchedules()
                        }
                        .frame(width: 350, height: 498)
                        .padding(.leading,40)
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

struct ListAddPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        // 여기서 사용할 수 있는 적절한 데이터를 전달하여 미리보기를 생성하세요.
        let scheduleListViewModel = ScheduleListViewModel() // 예시로 빈 ViewModel을 생성
        return ListAddPracticeView(scheduleListViewModel: scheduleListViewModel)
    }
}
