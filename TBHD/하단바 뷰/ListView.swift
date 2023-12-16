//
//  ListView.swift
//  FirebasePractice
//
//  Created by tbhd on 2023/10/06.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import CoreLocation

struct ListView: View {
    @State private var sheetIsPresented = false
    @FirestoreQuery(collectionPath: "spots") var spots: [Spot]
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List(spots) { spot in
                    HStack{
                        VStack{
                            Text(spot.name)
                                .font(.title2)
                            Text(spot.address)
                                .font(.headline)
                        }
                        Spacer()
                        Button(action: {
                            // 버튼을 누른 장소의 정보를 가져옵니다.
                            let selectedName = spot.name
                            let selectedAddress = spot.address
                            let selectedLatitude = spot.latitude
                            let selectedLongitude = spot.longitude
                            let newSpot = Schedule(
                                    id: UUID().uuidString,
                                    name: selectedName,
                                    address: selectedAddress,
                                    latitude: selectedLatitude,
                                    longitude: selectedLongitude
                                ) // 새로운 장소 생성
                            
                            // Firebase Firestore에 데이터 추가
                            let db = Firestore.firestore()
                            do {
                                _ = try db.collection("schedule").addDocument(from: newSpot)
                            } catch {
                                print("Error adding spot: \(error.localizedDescription)")
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                        }

                }
            }
            .listStyle(.plain)
            .navigationTitle("장소 리스트")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button("완료") {
                        dismiss()
                    }
                }
        }
            .sheet(isPresented: $sheetIsPresented, content: {
                NavigationStack {
                    SpotDetailView(spot: Spot())
                }
            })
        }
    }
}

#Preview {
    ListView()
}

