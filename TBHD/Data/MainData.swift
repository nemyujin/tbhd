//
//  MainData.swift
//  TBHD
//
//  Created by tbhd on 2023/11/01.
//

import Foundation
import FirebaseDatabase

struct Card{
    let name: String
}

struct Pop{
    let name: String
}

struct PopMemo {
    let name: String
}

class MainData {
    static let shared = MainData()
    
    let cards: [Card] = [
        Card(name: "1"),
        Card(name: "image2"),
        Card(name: "image3"),
        Card(name: "image4"),
        Card(name: "image5")
    ]
    
    let pops: [Pop] = [
        Pop(name: "cp1"),
        Pop(name: "cp2"),
        Pop(name: "cp3"),
        Pop(name: "image4"),
        Pop(name: "image5"),
        Pop(name: "image6"),
        Pop(name: "image7"),
        Pop(name: "image8"),
        Pop(name: "image9"),
        Pop(name: "image10"),
        Pop(name: "image11"),
        Pop(name: "image12"),
        Pop(name: "image13"),
        Pop(name: "image14"),
        Pop(name: "image15")
    ]
    
    let popsmemo: [PopMemo] = [
        PopMemo(name: "팝업•캐릭터"),
        PopMemo(name: "팝업•아이돌"),
        PopMemo(name: "행사•배우"),
        PopMemo(name: "image4"),
        PopMemo(name: "image5"),
        PopMemo(name: "image6"),
        PopMemo(name: "image7"),
        PopMemo(name: "image8"),
        PopMemo(name: "image9"),
        PopMemo(name: "image10"),
        PopMemo(name: "image11"),
        PopMemo(name: "image12"),
        PopMemo(name: "image13"),
        PopMemo(name: "image14"),
        PopMemo(name: "image15")
    ]
    
    let popsmemo2: [PopMemo] = [
        PopMemo(name: "캐릭캐릭체인지 \n콜라보 카페"),
        PopMemo(name: "세븐틴 페스티벌\nSVT street in 성수"),
        PopMemo(name: "영화 ‘30’일\nVIP 시사회"),
        PopMemo(name: "image4"),
        PopMemo(name: "image5"),
        PopMemo(name: "image6"),
        PopMemo(name: "image7"),
        PopMemo(name: "image8"),
        PopMemo(name: "image9"),
        PopMemo(name: "image10"),
        PopMemo(name: "image11"),
        PopMemo(name: "image12"),
        PopMemo(name: "image13"),
        PopMemo(name: "image14"),
        PopMemo(name: "image15")
    ]
}
