//
//  PopupView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/18.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        NavigationStack {
            
            ScrollView{
                VStack{
                    VStack(alignment: .center, spacing: 12)
                    {
                        
                        HStack(alignment: .center, spacing: 4)
                        {
                            Text("팝업•캐릭터")
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
                            Text("캐릭캐릭체인지 콜라보 카페")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.9))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            Text("D-2")
                                .font(
                                    Font.custom("SF Pro Rounded", size: 15)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                .frame(minWidth: 28, maxWidth: 28, maxHeight: .infinity, alignment: .trailing)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 0)
                    .frame(maxWidth: .infinity, alignment: .top)
                    
                    HStack(alignment: .center, spacing: 0) 
                    {
                        Image(systemName: "photo.stack")
                          .font(Font.custom("SF Pro Display", size: 20))
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color.gray)
                    }
                    .padding(.horizontal, 0)
                    .padding(.top, 0)
                    .padding(.bottom, 208)
                    .frame(maxWidth: .infinity, minHeight: 256, maxHeight: 256, alignment: .center)
                    .background(
                      Image("cp상세1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    )
                    .background(.white)
                    .cornerRadius(12)
                    .overlay(
                      RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.15)
                        .stroke(Color.white.opacity(0.1), lineWidth: 0.3)
                    )
                
                }
                HStack{
                    VStack(alignment: .trailing, spacing: 8)
                    {
                        HStack(alignment: .top, spacing: 10)
                        {
                            Image(systemName: "mappin")
                                .font(
                                    Font.custom("SF Pro Rounded", size: 18)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.black.opacity(0.6))
                                .frame(minWidth: 22, maxWidth: 22, maxHeight: .infinity, alignment: .center)
                          
                            VStack(alignment: .leading, spacing: 8){
                                Text("현대백화점 신촌점 유플렉스 지하 1층")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 15)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(Color.black.opacity(0.9))
                                
                                Text("서울 서대문구 연세로 13")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 15)
                                            .weight(.light)
                                    )
                                    .foregroundColor(Color.black.opacity(0.9))
                            }
                            Spacer()
                            Image(systemName: "plus.circle")
                                .font(
                                    Font.custom("SF Pro Display", size: 22)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color.black.opacity(0.5))
                        }
                        .padding(0)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    .background(Color.black.opacity(0.05))
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
                
            
                    HStack(alignment: .center, spacing: 6)
                    {
                        HStack(alignment: .center, spacing: 6)
                        {
                            Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                                .font(
                                    Font.custom("SF Pro Display", size: 18)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                            
                            Text("경로 탐색")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color.black.opacity(0.9))
                        }
                        .padding(.leading, 0)
                        .padding(.trailing, 2)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 0)
                    .frame(maxWidth: .infinity, minHeight: 59, maxHeight: 59, alignment: .trailing)
                    
                    Spacer()
                    .frame(height: 48)
                
                    HStack(alignment: .center)
                    {
                      
                            Text("상세정보")
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
                            Image(systemName: "calendar.badge.checkmark")
                              .font(
                                Font.custom("SF Pro Rounded", size: 17)
                                  .weight(.medium)
                              )
                              .foregroundColor(Color.black.opacity(0.6))
                              .frame(minWidth: 22, maxWidth: 22, maxHeight: .infinity, alignment: .leading)
                            
                            Text("2023. 09. 22 ~ 2023. 11.19")
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
                                HStack(alignment: .top, spacing: 8)
                                {
                                    Image(systemName: "clock")
                                        .font(
                                            Font.custom("SF Pro Rounded", size: 18)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(Color.black.opacity(0.6))
                                        .frame(minWidth: 22, maxWidth: 22, maxHeight: .infinity, alignment: .leading)
                                }
                                
                                HStack(alignment: .top, spacing: 12)
                                {
                                    Text("영업 중")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.bold)
                                        )
                                        .kerning(0.5)
                                        .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                        .frame(minWidth: 45, maxWidth: 45, maxHeight: .infinity, alignment: .leading)
                                }
                                .padding(.horizontal, 0)
                                .padding(.top, 1)
                                .padding(.bottom, 0)
                                
        
                                VStack(alignment:.leading){
                                    Text("10:30 ~ 22:00")
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
                            
                            VStack(alignment: .leading, spacing: 12) 
                            {
                                Text("월  10:30 ~ 22:00")
                                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(minWidth: 124, maxWidth: 124, maxHeight: .infinity, alignment: .leading)
                                Text("화  10:30 ~ 22:00")
                                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(minWidth: 124, maxWidth: 124, maxHeight: .infinity, alignment: .leading)
                                Text("수  10:30 ~ 22:00")
                                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(minWidth: 124, maxWidth: 124, maxHeight: .infinity, alignment: .leading)
                                Text("목  10:30 ~ 22:00")
                                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(minWidth: 124, maxWidth: 124, maxHeight: .infinity, alignment: .leading)
                                Text("금  10:30 ~ 22:00")
                                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(minWidth: 124, maxWidth: 124, maxHeight: .infinity, alignment: .leading)
                                Text("토  10:30 ~ 22:00")
                                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(minWidth: 124, maxWidth: 124, maxHeight: .infinity, alignment: .leading)
                                Text("일  10:30 ~ 22:00")
                                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(minWidth: 124, maxWidth: 124, maxHeight: .infinity, alignment: .leading)
                                
                            }
                            .padding(.leading, 24)
                            .padding(.trailing, 20)
                            .padding(.vertical, 0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            HStack(alignment: .top, spacing: 8) 
                            {
                                Image(systemName: "clock.badge.exclamationmark")
                                  .font(
                                    Font.custom("SF Pro Rounded", size: 17)
                                      .weight(.medium)
                                  )
                                  .foregroundColor(Color.black.opacity(0.6))
                                  .frame(width: 22, height: 17, alignment: .leading)
                                    
                                Text("비정기적 휴무일 있음")
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
    PopupView()
}
