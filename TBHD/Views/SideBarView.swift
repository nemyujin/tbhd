//
//  SideBarView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/17.
//

import SwiftUI

struct SideBarView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top) {
                    Image(systemName:"chevron.backward")
                        .font(
                            Font.custom("SF Pro Display", size: 20)
                                .weight(.medium)
                        )
                        .foregroundColor(Color.black)
                        .frame(width: 15, alignment: .topLeading)
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 0)
                .frame(width: 310, alignment: .topLeading)
                
                VStack(alignment: .trailing, spacing: 28)
                {
                    //민굥개, 계정명, 프사,편집
                    HStack(alignment: .center, spacing: 8)
                    {
                        VStack(alignment: .leading, spacing: 5)
                        {
                            Text("민굥개")
                                .font(Font.custom("Apple SD Gothic Neo", size: 18))
                                .foregroundColor(Color.black.opacity(0.9))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            Text("@nemyujin0724")
                                .font(Font.custom("SF Pro Display", size: 14))
                                .foregroundColor(Color.black.opacity(0.5))
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 0)
                        .padding(.bottom, 3)
                        .frame(width: 310, alignment: .topLeading)
                        
                        VStack(alignment: .center, spacing: 10)
                        {
                            Image("Ellipse 22")
                                .frame(width: 52, height: 52)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            
                            Text("편집")
                                .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color.black.opacity(0.5))
                        }
                        .padding(0)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //쿠키,팔로잉,팔로워
                    VStack(alignment: .trailing, spacing: 20)
                    {
                        HStack(alignment: .top, spacing: 20)
                        {
                            Text("🍪")
                                .font(Font.custom("SF Pro Display", size: 16))
                                .kerning(0.08)
                                .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.9))
                        }
                        .padding(.leading, 4)
                        .padding(.trailing, 0)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        HStack(alignment: .top, spacing: 24)
                        {
                            HStack{
                                Text("23")
                                    .font(
                                        Font.custom("SF Pro Display", size: 13)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color.black.opacity(0.9))
                                    .frame(maxHeight: .infinity, alignment: .topLeading)
                                
                                Text("팔로잉")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 13))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.black.opacity(0.6))
                                    .frame(minWidth: 34, maxHeight: .infinity, alignment: .top)
                            }
                            
                            HStack{
                                Text("3")
                                    .font(
                                        Font.custom("SF Pro Display", size: 13)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color.black.opacity(0.9))
                                    .frame(maxHeight: .infinity, alignment: .topLeading)
                                
                                Text("팔로워")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 13))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.black.opacity(0.6))
                                    .frame(minWidth: 34, maxWidth: 34, maxHeight: .infinity, alignment: .top)
                            }
                        }
                        .padding(.leading, 4)
                        .padding(.trailing, 0)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    
                }
                .padding(.horizontal, 28)
                .padding(.top, 8)
                .padding(.bottom, 0)
                .frame(width: 310, alignment: .topLeading)
                
                Spacer()
                    .frame(height: 28)
                //내여행,좋아요,리뷰
                HStack(alignment: .top) {
                    
                    VStack(alignment: .center, spacing: 10)
                    {
                        HStack(alignment: .bottom, spacing: 10)
                        {
                            Text("5")
                                .font(
                                    Font.custom("SF Pro Display", size: 16)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                .frame(maxWidth: .infinity, alignment: .top)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .bottom)
                        
                        
                        Text("내 여행")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 13)
                                    .weight(.regular)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black.opacity(0.9))
                    }
                    .padding(0)
                    
                    Spacer()
                    
                    
                    VStack(alignment: .center, spacing: 10)
                    {
                        HStack(alignment: .bottom, spacing: 10)
                        {
                            Text("13")
                                .font(
                                    Font.custom("SF Pro Display", size: 16)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                .frame(maxWidth: .infinity, alignment: .top)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .bottom)
                        
                        
                        Text("좋아요")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 13)
                                    .weight(.regular)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black.opacity(0.9))
                    }
                    .padding(0)
                    
                    Spacer()
                    
                    //내여행,좋아요,리뷰
                    VStack(alignment: .center, spacing: 10)
                    {
                        HStack(alignment: .bottom, spacing: 10)
                        {
                            Text("20")
                                .font(
                                    Font.custom("SF Pro Display", size: 16)
                                        .weight(.regular)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                .frame(maxWidth: .infinity, alignment: .top)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .bottom)
                        
                        
                        Text("리뷰")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 13)
                                    .weight(.regular)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black.opacity(0.9))
                    }
                    .padding(0)
                }
                .frame(width: 310, alignment: .topLeading)
                
                Spacer()
                    .frame(height:63)
                
                //멤버쉽 카드, 대여한 도서, 여행 도구, 퀘스트
                VStack(alignment: .leading, spacing: 4)
                {
                    VStack(alignment: .leading, spacing: 64)
                    {
                        HStack(alignment: .top, spacing: 15)
                        {
                            Image(systemName: "person.crop.square.filled.and.at.rectangle")
                                .font(Font.custom("SF Pro Display", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.black.opacity(0.8))
                                .frame(minWidth: 29, maxWidth: 29, maxHeight: .infinity, alignment: .top)
                            
                            Text("멤버쉽 카드")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.8))
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        HStack(alignment: .top, spacing: 15)
                        {
                            Image(systemName: "bookmark")
                                .font(Font.custom("SF Pro Display", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.black.opacity(0.8))
                                .frame(minWidth: 29, maxWidth: 29, maxHeight: .infinity, alignment: .top)
                            
                            Text("대여한 도서")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.8))
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        HStack(alignment: .top, spacing: 15)
                        {
                            Image(systemName: "tray.full")
                                .font(Font.custom("SF Pro Display", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.black.opacity(0.8))
                                .frame(minWidth: 29, maxWidth: 29, maxHeight: .infinity, alignment: .top)
                            
                            Text("여행 도구")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.8))
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        HStack(alignment: .top, spacing: 15)
                        {
                            Image(systemName: "star.fill")
                                .font(Font.custom("SF Pro Display", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.black.opacity(0.8))
                                .frame(minWidth: 29, maxWidth: 29, maxHeight: .infinity, alignment: .top)
                            
                            Text("퀘스트")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.8))
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(.vertical, 0)
                .frame(width: 310, alignment: .topLeading)
                
                HStack(alignment: .top, spacing: 24)
                {
                    Button {
                            // 버튼을 누르면 컨텍스트 메뉴가 나타남
                        } label: {
                            Image(systemName: "gear")
                                .font(Font.custom("SF Pro Display", size: 22))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color.black.opacity(0.5))
                        }
                        .contextMenu {
                            Button("Logout") {
                                viewModel.logout()
                            }
                        }
                }
                .padding(.horizontal, 24)
                .padding(.top, 44)
                .padding(.bottom, 56)
                .frame(maxWidth: .infinity, alignment: .topTrailing)

            }
        }
        .background(Color.white)

        
       
       
   

    }
}

#Preview {
    SideBarView()
}
