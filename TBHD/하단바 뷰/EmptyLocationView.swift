//
//  EmptyLocationView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/14.
//

import SwiftUI
import FirebaseFirestore

struct EmptyLocationView: View {
    @State private var selectedDate = Date() // 기본값 설정
    @Environment(\.dismiss) private var dismiss
    @State private var currentPage = 0 // 현재 페이지 번호를 추적하는 변수


    var body: some View {
        NavigationView {
            //카메라,생카투어,0개의 장소
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Image(systemName: "camera.fill")
                        .font(Font.custom("SF Pro Display", size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .frame(width: 73,height: 73)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(8)
                    Spacer()
                        .frame(width: 12)
                    VStack(alignment: .leading,spacing: 4){
                        Text("지민 생카투어")
                            .font(Font.custom("SF Pro", size: 20))
                            .foregroundColor(Color.black)
                        Text("0개의 장소")
                            .font(Font.custom("SF Pro", size: 18))
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                    .padding(.trailing,150)
                    .frame(width:265,height: 73)
                }
                .frame(width:390,height: 73)
                .padding(.horizontal,20)
                HStack(spacing:180
                ){
                    //달력
                    HStack{
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                        
                        
                        var dateFormatter: DateFormatter {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd"
                            return formatter
                            
                        }
                    }
                    .frame(width: 130,height: 86)
                    
                    HStack{
                        //핑,부산
                        Image(systemName: "mappin")
                            .font(
                                Font.custom("SF Pro Display", size: 13)
                                    .weight(.semibold)
                            )
                            .kerning(0.5)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color.black.opacity(0.5))
                        Text("대전")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.semibold)
                            )
                            .kerning(0.5)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                    .frame(width: 54,height: 86)
                    
                    
                }
                .frame(width: 390,height: 86)
                .padding(.horizontal,20)
                
                //장소 추가 버튼
                NavigationLink(destination: ListView()) {
                    HStack(alignment: .center, spacing: 10)
                    {
                        Image(systemName: "plus.app.fill")
                            .font(
                                Font.custom("SF Pro", size: 24)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.04, green: 0.52, blue: 1))
                            .frame(width: 28, height: 28, alignment: .center)
                        
                        VStack(alignment: .leading, spacing: 0) 
                        {
                            Text("장소추가")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(Color.black)
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 12)
                        .padding(.bottom, 13)
                    }
                    .padding(0)
                    .frame(width: 390, alignment: .center)
                    
                }
            }
            }
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill") // 원하는 이미지 사용
                            .font(.title2)
                         .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.2))
                    }
                }
            })
    }
}


#Preview {
    EmptyLocationView()
}
