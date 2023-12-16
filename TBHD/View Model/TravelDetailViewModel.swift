//
//  TravelDetailViewModel.swift
//  TBHD
//
//  Created by tbhd on 2023/11/09.
//
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TravelDetailViewModel: ObservableObject {
    var currentUserID: String?
    
    @Published var travelEvents: [TravelEvent] = [] {
           didSet {
               updateEventCount()
           }
       }
    @Published var eventCount: Int = 0
    
    func updateEventCount() {
            eventCount = travelEvents.count
        }

    init() {
        // 사용자 로그인 여부를 확인하고 UID를 가져옵니다.
        if let user = Auth.auth().currentUser {
            currentUserID = user.uid
        }
    }

    func saveEvent(title: String, location: String) {
        // currentUserID를 사용하여 데이터를 저장하거나 작업합니다.
        if let userID = currentUserID {
            let db = Firestore.firestore()
            let travelCollection = db.collection("users").document(userID).collection("travel")

            let eventData = TravelEvent(title: title, location: location, userID: userID)

            do {
                _ = try travelCollection.addDocument(from: eventData)
            } catch {
                print("Error adding document: \(error)")
            }
        }
    }

    func fetchTravelEvents(forUserID userID: String) {
        let db = Firestore.firestore()
        let travelCollection = db.collection("users").document(userID).collection("travel")

        travelCollection.addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Error fetching travel events: \(error)")
            } else {
                if let documents = querySnapshot?.documents {
                    self.travelEvents = documents.compactMap { document in
                        do {
                            return try document.data(as: TravelEvent.self)
                        } catch {
                            print("Error decoding document: \(error)")
                            return nil
                        }
                    }
                    
                    // 데이터를 가져온 후에 eventCount 업데이트
                    self.updateEventCount()
                }
            }
        }
    }

}
