//
//  TravelEvent.swift
//  TBHD
//
//  Created by tbhd on 2023/11/10.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct TravelEvent: Identifiable, Codable {
    @DocumentID var id: String? // Firebase에서 생성된 문서 ID
    var title: String
    var location: String
    @ServerTimestamp var date: Timestamp? // Firestore에서 자동으로 생성된 타임스탬프
    var userID: String // 사용자 UID

    // 기타 필요한 데이터 필드 추가
}

