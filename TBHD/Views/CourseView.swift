//
//  CourseView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/23.
//

import SwiftUI

struct CourseView: View {
    var body: some View {
        NavigationStack {
            
            ScrollView{
                VStack{
                    VStack(alignment: .center, spacing: 12)
                    {
                        
                        HStack(alignment: .center, spacing: 4)
                        {
                            Text("대전")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 15)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.6))
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        HStack(alignment: .top, spacing: 44)
                        {
                            Text("먹킷리스트 여행 편")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.9))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 0)
                    .frame(maxWidth: .infinity, alignment: .top)
                    
                    HStack(alignment: .center, spacing: 0)
                    {
                        TwitterEmbedView(urlString: "https://twitter.com/instiz/status/1573169137417068544?ref_src=twsrc%5Etfw")
                                    .frame(width: 300, height: 400)
                    }
                   
                
                }
                HStack{
                    VStack(alignment: .trailing, spacing: 8)
                    {
                        HStack(alignment: .top, spacing: 10)
                        {
                            
                          
                            VStack(alignment: .leading, spacing: 8){
                                
                                Text("대전의 명물 ‘성심당’에 가서 꽈배기랑 모카번만 사와 대전인의 탄식을 자아내게 했던 NCT127.....그래서 준비한! 대전의 딸 안유진의 ‘성심당’ Pick과 함께 대전 먹킷리스트 당일치기 코스를 알아보자.")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 15)
                                            .weight(.light)
                                    )
                                    .foregroundColor(Color.black.opacity(0.9))
                            }
                            Spacer()
                           
                        }
                        .padding(0)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.15)
                            .stroke(Color.white.opacity(0.3), lineWidth: 0.3)
                    )
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 0)
                .frame(width: 390, alignment: .top)
                
                    
                    Spacer()
                    .frame(height: 48)
                
                    HStack(alignment: .center)
                    {
                      
                            Text("✔️글 읽으셔야 할 분")
                              .font(
                                Font.custom("Apple SD Gothic Neo", size: 23)
                                  .weight(.bold)
                              )
                              .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 0)
                
                
                VStack(alignment: .leading, spacing: 24)
                {
                    VStack(alignment: .leading, spacing: 36)
                    {
                        HStack(alignment: .top, spacing: 10)
                        {

                            
                            Text("-대전이 노잼도시라고 생각하시는 분들")
                              .font(
                                Font.custom("SF Pro Rounded", size: 15)
                                  .weight(.medium)
                              )
                              .kerning(0.5)
                              .foregroundColor(Color.black.opacity(0.9))
                            
                        }
                        .padding(.leading, 0)
                        .padding(.trailing, 20)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        VStack(alignment: .leading, spacing: 28){
                            HStack(alignment: .top, spacing: 8)
                            {
                                
        
                                VStack(alignment:.leading){
                                    Text("-성심당 가는김에 대전 여행가고싶으신 분들")
                                        .font(
                                            Font.custom("SF Pro Rounded", size: 15)
                                                .weight(.medium)
                                        )
                                        .kerning(0.5)
                                        .foregroundColor(Color.black.opacity(0.8))
                                }
                            }
                            .padding(.leading, 0)
                            .padding(.trailing, 20)
                            .padding(.vertical, 0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                           
                            HStack(alignment: .top, spacing: 8)
                            {

                                    
                                Text("- 대전의 찐 맛집을 알고싶으신 분들")
                                  .font(
                                    Font.custom("Apple SD Gothic Neo", size: 15)
                                      .weight(.semibold)
                                  )
                                  .foregroundColor(Color(red: 1, green: 0.31, blue: 0.16).opacity(0.9))
                                
                                Spacer()
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .top)
                           
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                       
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .padding(.bottom, 32)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(16)
                    
                    Text("1. 칼국수 지도")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 15)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color.black.opacity(0.9))
                    
                    
                    Text("안유진 추천 픽 '두부 두루치기','칼국수' 뻔한 맛집 탐색이 지겨우시다면, 대전 칼국수 축제 공식홈페이지의 '칼국수 지도'를 추천한다.")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 15)
                                .weight(.light)
                        )
                        .foregroundColor(Color.black.opacity(0.9))
                    
                    Image("칼국수지도")
                    
                    VStack(alignment: .leading, spacing: 28){
                        
                        Text("2. 프렐류드")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color.black.opacity(0.9))
                        
                        
                        Text("소품샵. 에디터 구매 하울-북마크, 성냥 펜 등등")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.light)
                            )
                            .foregroundColor(Color.black.opacity(0.9))
                        
                        
                        Image("프렐류드")
                            .frame(width:10)
                            .offset(x:150)
                            
                            
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
                .frame(width: 390, alignment: .topLeading)
               
             
                
            }
              .toolbar {

                  ToolbarItem(placement: .navigationBarTrailing) {
                      Button {
                          // 버튼이 눌렸을 때 수행할 동작
                          
                      } label: {
                          Image(systemName: "heart") // 여기에 아이콘을 추가
                              .font(Font.custom("SF Pro Display", size: 22))
                              .foregroundColor(Color.black.opacity(0.9))
                      }
                  }
                  ToolbarItem(placement: .navigationBarTrailing) {
                      Button {
                          // 버튼이 눌렸을 때 수행할 동작
                          
                      } label: {
                          Image(systemName: "arrowshape.turn.up.right") // 여기에 아이콘을 추가
                              .font(Font.custom("SF Pro Display", size: 22))
                              .foregroundColor(Color.black.opacity(0.9))
                      }
                  }
              }
        }

    }
}

#Preview {
    CourseView()
}
