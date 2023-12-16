//
//  TravelDetailView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/04.
//

import SwiftUI
import UIKit

struct TravelDetailView: View {
    //커서
    @State private var text = ""
    //날짜
    @State private var selectedDate = Date()
    @State private var DetailisExpanded = false
    //카메라
    @State private var image: UIImage?
    @State private var isImagePickerPresented = false
    //취소,생성
    @Environment(\.presentationMode) var presentationMode
    @State private var isNewEventCreated = false
    //텍스트 인식
    @State private var enteredText = ""

    @ObservedObject var viewModel = TravelDetailViewModel() // ViewModel 초기화

    var body: some View {
        ScrollView{
            //일정추가
            VStack(alignment: .leading, spacing: 20){
                //취소,새로운일정,생성
                // 취소,새로운일정,생성
                HStack(alignment: .top) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                            .font(Font.custom("SF Pro", size: 20))
                            .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                    }
                    Spacer()
                    
                    Text("새로운 일정")
                        .font(Font.custom("SF Pro", size: 20))
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    Text("생성")
                        .font(Font.custom("SF Pro", size: 20))
                        .foregroundColor(!enteredText.isEmpty ? Color(red: 0.82, green: 0.53, blue: 1) : Color.black.opacity(0.2))
                        .onTapGesture {
                            // "생성" 텍스트를 누를 때 필요한 작업을 수행
                            if !enteredText.isEmpty {

                                // "생성" 버튼을 누를 때 TravelDetailViewModel의 saveEvent 메서드 호출
                                                viewModel.saveEvent(title: enteredText, location: "여행 장소") // location을 필요에 따라 수정
                                isNewEventCreated = true // 텍스트가 비어 있지 않으면 "생성"을 활성화합니다.
                                presentationMode.wrappedValue.dismiss() // 시트를 닫습니다.
                            }
                        }
                }
                .padding(.vertical, 0)
                .frame(width: 350, height: 50)
    
                //카메라,제목,0개의 장소
                HStack
                {
                    //카메라,네모
                    ZStack{
                        if let image = image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .cornerRadius(12)
                        } else {
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color.black.opacity(0.2))
                                .cornerRadius(12)
                                .onTapGesture {
                                    isImagePickerPresented.toggle()
                                }
                            
                            Image(systemName: "camera.fill")
                                .font(
                                    Font.custom("SF Pro", size: 32)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .onTapGesture {
                                    isImagePickerPresented.toggle()
                                }
                        }
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(image: $image)
                    }
                    //제목,0개의 장소
                    VStack(alignment: .leading) {
                        //제목
                        TextField("제목", text: $enteredText)
                            .font(Font.custom("SF Pro", size: 32))
                            .textFieldStyle(.automatic)
                            .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37, alignment: .leading)
                        
                        //0개의 장소
                        Text("0개의 장소")
                            .font(Font.custom("SF Pro", size: 18))
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                }
                //날짜
                HStack{
                    var dateFormatter: DateFormatter {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd"
                        return formatter
                    }
                    
                    if !DetailisExpanded {
                        DatePicker("", selection: $selectedDate,displayedComponents: .date)
                            .datePickerStyle(.automatic) // 확장된 모드 사용
                            .onTapGesture {
                                DetailisExpanded = false // DatePicker를 클릭하면 다시 축소
                            }
                    }
                    if DetailisExpanded {
                        DatePicker("", selection: $selectedDate)
                            .datePickerStyle(.automatic) // 확장된 모드 사용
                            .onTapGesture {
                                DetailisExpanded = false // DatePicker를 클릭하면 다시 축소
                            }
                    }
                    Spacer()
                        .frame(width: 240)
                }
                //플러스 버튼,도시추가
                HStack(alignment: .center, spacing: 10){
                    //플러스 버튼
                    Image(systemName: "plus.app.fill")
                        .font(
                            Font.custom("SF Pro", size: 20)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.04, green: 0.52, blue: 1))
                        .frame(width: 28, height: 28, alignment: .center)
                    //도시추가
                    Text("도시추가")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(.black)
                        .frame(width: 62, height: 19, alignment: .center)
                }
                
                .padding(.trailing, 196)
                .padding(.vertical, 0)
                .frame(width: 320, height: 44, alignment: .leading)
                
            }
            
            .padding(.horizontal, 20)
            .padding(.leading,20)
            
        }
        
    }
}

#Preview {
    TravelDetailView()
}
