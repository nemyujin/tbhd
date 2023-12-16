//
//  LibraryView.swift
//  TBHD
//
//  Created by tbhd on 2023/10/31.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import CoreLocation
import MapKit


struct LibraryView: View {
    //더보기 버튼 때문에 만든거
    @State private var isExpanded = false
    let coursecard = LibraryData.shared.CourseCards
    let region = LibraryData.shared.regions
    let course = LibraryData.shared.course
    let coursememo = LibraryData.shared.coursememo
    let hotplace = PlaceData.shared.placeCard
    @State private var selectedCategory: String = "전체"
    
    var filteredHotPlaces: [HotPlace] {
            if selectedCategory == "전체" {
                return hotplace
            } else {
                return hotplace.filter { $0.category == selectedCategory }
            }
        }
    
    let rows = Array(repeating: GridItem(.fixed(100), spacing: 20), count: 3)
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    VStack(alignment: .leading, spacing: 4)
                    {
                        //인기 스팟 순위,요즘 뜨는 핫플레이스가 궁금하다면
                        Text("인기 스팟 순위")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1).opacity(0.9))
                        Text("요즘 뜨는 핫플레이스가 궁금하다면")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color.black)
                    }
                    .padding(.leading,20)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .leading, spacing: 16){
                        //버튼
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [GridItem(.adaptive(minimum: 100))], spacing: 18) {
                                ForEach(["전체","식당", "카페", "팝업스토어", "소품샵"], id: \.self) { category in
                                    Button(action: {
                                        // 버튼이 눌린 경우 선택된 카테고리 업데이트
                                        selectedCategory = category
                                    }) {
                                        Text(category)
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 14)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(selectedCategory == category ? Color.white: Color.black.opacity(0.5))
                                            .padding(.horizontal, 14)
                                            .padding(.top, 10)
                                            .padding(.bottom, 8)
                                            .background(selectedCategory == category ? Color.black: Color.black.opacity(0.05))
                                            .cornerRadius(999)
                                    }
                                    .buttonStyle(PlainButtonStyle()) // 버튼 스타일을 PlainButtonStyle로 지정하여 기본 스타일을 사용
                                    .foregroundColor(.blue) // 눌린 상태의 색상을 여기에 설정
                                }
                            }
                        }
                        
                        // 장소 배너
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: rows) {
                                ForEach(filteredHotPlaces, id: \.name) { place in
                                    HStack(alignment: .center, spacing: 15){
                                        
                                        Image(place.imageAssetName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 107, height: 107)
                                            .clipped()
                                            .cornerRadius(8)
                                        
                                        //식당명,카테고리,지역,추가,길찾기
                                        VStack(alignment: .leading, spacing: 5)
                                        {
                                            Text(place.name)
                                                .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                                .foregroundColor(Color.black.opacity(0.9))
                                            
                                            Text(place.address)
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                                .padding(.bottom, 4)
                                            
                                            //추가,길찾기
                                            HStack(alignment: .top) {
                                                
                                                Button(action: {
                                                    // 버튼을 누른 장소의 정보를 가져옵니다.
                                                    let selectedName = place.name
                                                    let selectedAddress = place.address
                                                    let selectedLatitude = place.latitude
                                                    let selectedLongitude = place.longitude
                                                    
                                                    
                                                    // HotPlace 데이터를 사용하여 Spot 객체를 생성합니다.
                                                    let newSpot = Spot(
                                                        id: UUID().uuidString,
                                                        name: selectedName,
                                                        address: selectedAddress,
                                                        latitude: selectedLatitude,
                                                        longitude: selectedLongitude
                                                    )
                                                    
                                                    // Firebase Firestore에 데이터 추가
                                                    let db = Firestore.firestore()
                                                    do {
                                                        _ = try db.collection("spots").addDocument(from: newSpot)
                                                    } catch {
                                                        print("Error adding spot: \(error.localizedDescription)")
                                                    }
                                                }) {
                                                    Image(systemName: "plus.circle")
                                                        .font(Font.custom("SF Pro Display", size: 22))
                                                        .foregroundColor(Color.black.opacity(0.5))
                                                }
                                                
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    // 버튼을 누른 장소의 정보를 가져옵니다.
                                                    let selectedName = place.name
                                                    let selectedAddress = place.address
                                                    let selectedLatitude = place.latitude
                                                    let selectedLongitude = place.longitude
                                                    
                                                    // 선택한 위치에 대한 placemark를 만듭니다.
                                                    let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: selectedLatitude, longitude: selectedLongitude), addressDictionary: nil)
                                                    
                                                    // placemark를 사용하여 map item을 만듭니다.
                                                    let mapItem = MKMapItem(placemark: placemark)
                                                    
                                                    // Apple Maps에서 더 나은 사용자 경험을 위해 위치의 이름을 설정합니다.
                                                    mapItem.name = selectedName
                                                    
                                                    // 선택한 위치로 Apple Maps를 엽니다.
                                                    mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
                                                }) {
                                                    Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                                                        .font(Font.custom("SF Pro Display", size: 22)
                                                            .weight(.semibold))
                                                        .multilineTextAlignment(.trailing)
                                                        .foregroundColor(Color.black.opacity(0.9))
                                                }
                                                
                                                
                                            }
                                            .padding(0)
                                            .frame(width: 176, alignment: .top)
                                        }
                                        .padding(0)
                                        .frame(height: 36, alignment: .leading)
                                        
                                    }
                                    .padding(0)
                                    .frame(width:302, height: 107, alignment: .leading)
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 28)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(16)
                            .foregroundColor(.clear)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 0)
                    .frame(width: 390, alignment: .topLeading)
                    
                    Spacer()
                        .frame(height:76)
                    
                    //코스 찾기,지금 인기있는 지역별 인기코스,더보기
                    HStack{
                        //코스 찾기,지금 인기있는 지역별 인기코스
                        VStack(alignment: .leading, spacing: 4) {
                            //지금 인기있는 지역별 인기코스
                            Text("지금 핫한 지역별 인기코스")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1).opacity(0.9))
                            //코스찾기
                            Text("코스 찾기")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.9))
                            
                        }
                        //더보기
                        Text("더 보기")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 13)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color.black)
                            .position(x:150, y:20.5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 0)
                    .frame(width: 390,height: 38, alignment: .leading)
                    //미니배너
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(coursecard.indices, id: \.self) { index in
                                    VStack(alignment: .leading, spacing: 10) { // 각 이미지와 텍스트를 래핑하는 VStack
                                        //이미지
                                        NavigationLink(destination:CourseView()) {
                                            Image(coursecard[index].name)
                                                .foregroundColor(.clear)
                                                .frame(width: 277, height: 277)
                                                .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                                                .cornerRadius(4)
                                        }
                                        //지역
                                        Text(region[index].name)
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 16)
                                                    .weight(.medium)
                                            )
                                            .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                        //코스,플러스버튼
                                        HStack(alignment: .top){
                                            //코스
                                            Text(course[index].name)
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 19)
                                                        .weight(.medium)
                                                )
                                                .foregroundColor(Color.black.opacity(0.9))
                                            Spacer()
                                            Image(systemName: "plus.circle")
                                                .font(Font.custom("SF Pro Display", size: 22))
                                                .multilineTextAlignment(.trailing)
                                                .foregroundColor(Color.black.opacity(0.9))
                                        }
                                        //코스설명,더보기 버튼
                                        ZStack {
                                            //코스설명
                                            Text(isExpanded ? coursememo[index].name : String(coursememo[index].name.prefix(84)))
                                                .font(Font.custom("Apple SD Gothic Neo", size: 14))
                                                .foregroundColor(Color.black.opacity(0.5))
                                                .frame(width: 273, height: 86, alignment: .topLeading)
                                            //더보기버튼
                                            Button(action: {
                                                isExpanded.toggle()
                                            }) {
                                                Text(isExpanded ? "접기" : "더보기")
                                                    .font(
                                                        Font.custom("Apple SD Gothic Neo", size: 13)
                                                            .weight(.semibold)
                                                    )
                                                    .foregroundColor(Color.black)
                                            }
                                            .position(x: 270, y: 43)
                                            
                                        }
                                        
                                    }
                                
                                
                            }
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 0)
                    .padding(.vertical, 0)
                    .frame(width: 370, alignment: .topLeading)
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
