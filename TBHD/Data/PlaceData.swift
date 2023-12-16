//
//  PlaceData.swift
//  TBHD
//
//  Created by tbhd on 2023/11/15.
//

import Foundation

struct HotPlace: Identifiable, Hashable {
    var id: UUID = UUID()
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
    let category: String
    let imageAssetName: String
}

class PlaceData {
    static let shared = PlaceData()
    
    let placeCard: [HotPlace] = [
        HotPlace(name: "메종 파이프그라운드", address: "서울 성동구", latitude: 37.543, longitude: 127.044, category: "식당", imageAssetName:"메종파이프그라운드"),
        HotPlace(name: "핀치", address: "서울 종로구", latitude:  37.579, longitude: 126.968, category: "식당", imageAssetName:"핀치"),
        HotPlace(name: "오레노라멘", address: "서울 마포구", latitude: 37.543, longitude: 127.044, category: "식당", imageAssetName:"오레노라멘"),
        HotPlace(name: "고트델리", address: "서울 종로구", latitude:  37.579, longitude: 126.968, category: "식당", imageAssetName:"고트델리"),
        
        HotPlace(name: "원형들", address: "서울 중구", latitude:  37.562, longitude: 126.996, category: "카페",imageAssetName:"원형들"),
        HotPlace(name: "재해석", address: "서울 중구", latitude: 37.562, longitude: 126.994, category: "카페",imageAssetName:"재해석"),
        HotPlace(name: "접속", address: "대구 중구", latitude: 35.870, longitude: 128.596, category: "카페",imageAssetName:"접속"),
        HotPlace(name: "머메이드레시피", address: "경기 광주시", latitude: 37.416, longitude: 127.248, category: "카페",imageAssetName:""),
        
        HotPlace(name: "덴스", address: "서울 종로구", latitude: 37.576, longitude: 126.999, category: "소품샵",imageAssetName:""),
        HotPlace(name: "addd", address: "부산 서면", latitude:  35.154, longitude: 129.064, category: "소품샵",imageAssetName:""),
        HotPlace(name: "오에프알", address: "서울 종로구", latitude: 37.580, longitude: 126.971, category: "소품샵",imageAssetName:""),
        HotPlace(name: "코후꾸잡화점", address: "서울 마포구", latitude: 37.561, longitude: 126.921, category: "소품샵",imageAssetName:""),
        
        HotPlace(name: "먼작귀", address: "서울 서대문구", latitude: 37.556, longitude: 126.936, category: "팝업스토어",imageAssetName:""),
        HotPlace(name: "레드벨벳 ChillKill", address: "서울 종로구", latitude: 37.123, longitude: 127.456, category: "팝업스토어",imageAssetName:""),
        HotPlace(name: "푸바오", address: "서울 영등포구", latitude: 37.525, longitude: 126.928, category: "팝업스토어",imageAssetName:""),

        
        HotPlace(name: "더채: 라이브러리", address: "서울 종로구", latitude: 37.576, longitude: 126.973, category: "숙소",imageAssetName:""),
        HotPlace(name: "A better place ", address: "서울 종로구", latitude: 37.569, longitude: 126.986, category: "숙소",imageAssetName:""),
        HotPlace(name: "문향재 바이 버틀러리", address: "서울 종로구", latitude: 37.576, longitude: 126.970, category: "숙소",imageAssetName:""),
    ]
}

