//
//  TravelView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/02.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

struct TravelView: View {

    //일정 모음
    @State private var isScheduleOpen = false
    //일정 추가
    @State private var isPresentingSheet = false
    //일정 모음
    @State private var isPresentingPlan = false
    @ObservedObject var travelDetailViewModel: TravelDetailViewModel

    init() {
        self.travelDetailViewModel = TravelDetailViewModel()
    }


    var body: some View {
        NavigationView {
            VStack{
                //+버튼, 2023년, 편집
                HStack(alignment: .top){
                    //플러스버튼
                    Button(action: {
                        isPresentingSheet.toggle() // 버튼을 누를 때마다 sheet를 열거나 닫습니다.
                    })
                    {
                        Image(systemName: "plus")
                            .font(Font.custom("SF Pro Display", size: 30).weight(.medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                    }
                    .sheet(isPresented: $isPresentingSheet) {
                        TravelDetailView()
                    }
                    Spacer()
                    //2023
                    Text("2023")
                        .font(
                            Font.custom("SF Pro Display", size: 20)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color.black)
                    //년
                    Text("년")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 20)
                                .weight(.semibold)
                        )
                        .kerning(0.5)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color.black)
                    Spacer()
                    //편집
                    Text("편집")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 17)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                    
                }
                .padding(.vertical, 0)
                .frame(width: 350,height: 50, alignment: .top)
                .padding(.top, 40)
                //일정 블럭 모음
                HStack{
                    //월
                    Text("10월")
                        .font(Font.custom("SF Pro Display", size: 22))
                        .foregroundColor(Color.black)
                    Spacer()
                    //일정 갯수, 일정 열기/닫기 버튼
                    Text("1")
                        .font(
                            Font.custom("SF Pro Rounded", size: 20)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black.opacity(0.4))
                        .frame(width: 15, height: 40, alignment: .leading)
                    
                    Image(systemName:"chevron.down")
                }
                .frame(width: 350, height: 42)
                .padding(.top, 12)
                
                ScrollView{
                    VStack{
                        //일정 블럭
                        ForEach(travelDetailViewModel.travelEvents, id: \.id)
                        { event in
                               ZStack
                               {
                                   //네모
                                       Rectangle()
                                           .foregroundColor(.clear)
                                           .frame(width: 350, height: 126)
                                           .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                                           .cornerRadius(16)
                                   
                                   VStack{
                                       //일,요일,일정명,디데이
                                       HStack(alignment: .top, spacing: 12) {
                                           //일,요일
                                           HStack(alignment: .top, spacing: 8){
                                               //일,요일
                                               VStack(alignment: .leading, spacing: 2){
                                                   //일
                                                   Text(event.date?.dateValue().description ?? "")
                                                       .font(Font.custom("SF Pro Display", size: 26))
                                                       .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                                                       .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.5))
                                                   
                                                   //요일
                                                   Text(event.date?.dateValue().description ?? "")
                                                       .font(
                                                           Font.custom("Apple SD Gothic Neo", size: 12)
                                                               .weight(.medium)
                                                       )
                                                       .multilineTextAlignment(.trailing)
                                                       .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.5))
                                                       .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.9))
                                                       .frame(maxWidth: .infinity, alignment: .bottomLeading)
                                               }
                                           }
                                           .padding(.leading, 60)
                                           .padding(.top, 12)
                                           .padding(.bottom, 0)
                                           .frame(width: 140, height: 63, alignment: .topLeading)
                                           
                                           
                                           //일정명,디데이
                                           VStack(alignment: .leading, spacing: 4){
                                               //일정명
                                               Text(event.title)
                                                   .font(
                                                       Font.custom("Apple SD Gothic Neo", size: 20)
                                                           .weight(.medium)
                                                   )
                                                   .kerning(0.5)
                                                   .multilineTextAlignment(.trailing)
                                                   .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.9))
                                                   .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.9))
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                               
                                               // 기타 필요한 정보 표시
                                           }
                                           .padding(.leading, 0)
                                           .padding(.trailing, 12)
                                           .padding(.top, 16)
                                           .padding(.bottom, 0)
                                           .frame(width: 191, alignment: .topLeading)
                                           
                                           
                                           
                                           //더보기 아이콘
                                           Image(systemName: "ellipsis.circle")
                                               .font(
                                                   Font.custom("SF Pro Display", size: 22)
                                                       .weight(.light)
                                               )
                                               .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.2))
                                               .padding(.leading, 0)
                                               .padding(.trailing, 12)
                                               .padding(.top, 12)
                                               .padding(.bottom, 0)
                                               .frame(width: 40, height: 63, alignment: .topTrailing)
                                       }
                                       .frame(width: 350, height: 79, alignment: .topTrailing)
                                       
                                       //핑,지역
                                       HStack
                                       {
                                           Image(systemName: "mappin")
                                               .font(
                                                   Font.custom("SF Pro Display", size: 13)
                                                       .weight(.semibold)
                                               )
                                               .kerning(0.5)
                                               .multilineTextAlignment(.trailing)
                                               .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.5))
                                           Text(event.location)
                                               .font(
                                                   Font.custom("Apple SD Gothic Neo", size: 16)
                                                       .weight(.semibold)
                                               )
                                               .kerning(0.5)
                                               .multilineTextAlignment(.trailing)
                                               .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.5))
                                       }
                                       .padding(.horizontal, 16)
                                       .padding(.vertical, 0)
                                       .frame(width: 350, height: 43, alignment: .topLeading)
                               }
                           }
                       }
                       
                       .onAppear {
                           // Firebase Authentication을 사용하여 현재 사용자를 가져옵니다.
                           if let user = Auth.auth().currentUser {
                               let userID = user.uid
                               
                               // 사용자 아이디를 사용하여 Firestore에서 데이터를 가져옵니다.
                               travelDetailViewModel.fetchTravelEvents(forUserID: userID)
                           }
                       }

                    }
                }
            }
            .navigationBarItems(leading: Text("내 여행").fontWeight(.medium).font(.title))
        }
    }
    
}

#Preview {
    TravelView()
}
