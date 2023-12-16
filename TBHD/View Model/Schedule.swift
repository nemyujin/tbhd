//
//  Schedule.swift
//  TBHD
//
//  Created by tbhd on 2023/11/13.
//

import Foundation
import FirebaseFirestore
import CoreLocation

struct Schedule: Identifiable, Codable , Equatable{
    @DocumentID var id: String?
    var name = ""
    var address = ""
    var latitude = 0.0
    var longitude = 0.0
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}



class ScheduleListViewModel: ObservableObject {
    @Published var schedules: [Schedule] = []

    private var db = Firestore.firestore()

    func fetchSchedules() {
        db.collection("schedule").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            self.schedules = documents.compactMap { document in
                do {
                    var schedule = try document.data(as: Schedule.self)
                    
                    // Firestore 문서에서 가져온 위도와 경도를 Schedule 객체에 설정
                    schedule.latitude = document["latitude"] as? Double ?? 0.0
                    schedule.longitude = document["longitude"] as? Double ?? 0.0

                    return schedule
                } catch {
                    print("Error decoding schedule: \(error.localizedDescription)")
                    return nil
                }
            }
        }
    }

    // 나머지 코드는 그대로 둡니다.
    func delete(atOffsets indexSet: IndexSet) {
        schedules.remove(atOffsets: indexSet)
    }

    func move(fromOffsets source: IndexSet, toOffset destination: Int) {
        schedules.move(fromOffsets: source, toOffset: destination)
    }
}


