//
//  SpotViewModel.swift
//  FirebasePractice
//
//  Created by tbhd on 2023/10/06.
//

import Foundation
import FirebaseFirestore
import Firebase

class SpotViewModel: ObservableObject {
    @Published var spots: [Spot] = []
    @Published var savedSpots: [Spot] = [] // 저장된 장소를 관리하는 배열

    
    func saveSpot(spot: Spot) async -> Bool {
        let db = Firestore.firestore()
        
        if let id = spot.id {
            do {
                try await db.collection("spots").document(id).setData(spot.dictionary)
                print("Data updated successfully!")
                return true
            } catch {
                print("ERROR: Could not update data in 'spots': \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                try await db.collection("spots").addDocument(data: spot.dictionary)
                print("Data updated successfully!")
                return true
            } catch {
                print("ERROR: Could not update data in 'spots': \(error.localizedDescription)")
                return false
            }
        }
    }
    
    // Firebase에서 데이터 가져오기
    func fetchFirebaseSpots() {
        let db = Firestore.firestore()
        db.collection("spots").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            var firebaseSpots: [Spot] = []
            for document in querySnapshot!.documents {
                if let data = document.data() as? [String: Any] {
                    if let name = data["name"] as? String,
                       let address = data["address"] as? String,
                       let latitude = data["latitude"] as? Double,
                       let longitude = data["longitude"] as? Double {
                        let spot = Spot(name: name, address: address, latitude: latitude, longitude: longitude)
                        firebaseSpots.append(spot)
                    }
                }
            }
            
            self.spots = firebaseSpots
        }
    }
    // 장소 추가 메서드
       func addSpot(_ spot: Spot) {
           savedSpots.append(spot)
       }
}

