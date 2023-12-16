//
//  MainBarView.swift
//  TBHD
//
//  Created by tbhd on 2023/10/31.
//

import SwiftUI

struct MainBarView: View {
    //상단바
    @State private var selectedOption = 0
    //하단바
    @State private var selectedTab = 0
    @State private var isSidebarVisible = false
    var body: some View {
        NavigationStack{
            ZStack(alignment:.topTrailing){
                VStack{
                    Spacer()
                        .frame(height: 40)
                    HStack(alignment: .top) {
                      // Space Between
                        Text("TEAM of (          )Buffs \n& Hot-bloodeD Guides")
                          .font(
                            Font.custom("SF Pro Display", size: 22)
                              .weight(.medium)
                          )
                          .foregroundColor(Color.black)
                          .frame(width: 216, alignment: .topLeading)
                      Spacer()
                      // Alternative Views and Spacers
                        Button(action: {
                                isSidebarVisible.toggle()
                            }) {
                                Image(systemName: "line.3.horizontal")
                                    .font(
                                        Font.custom("SF Pro Display", size: 26)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.black)
                                    
                            }
                            .frame(height: 40)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 24)
                    .padding(.bottom,10)
                    .frame(width: 390, alignment: .top)


                    //메뉴
                    HStack(alignment: .center, spacing: 40)
                    {
                        let options = ["학급신문", "도서관", "동아리"]
                        
                        Picker("Select an Option", selection: $selectedOption) {
                            ForEach(0..<options.count) { index in
                                Text(options[index])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        // OptionDetailView 뷰를 선택된 세그먼트에 따라 표시
                    }
                    .padding(0)
                    .frame(width: 350, alignment: .leading)
                    
                    if selectedOption == 0 {
                        MainView()
                    } else if selectedOption == 1 {
                        LibraryView()
                    }
                    else if selectedOption == 2 {
                        ClubView()
                    }
                    
                }
                if isSidebarVisible {
                    ZStack {
                        Color(.black)
                            .opacity(0.25)
                    }.onTapGesture {
                        withAnimation(.easeInOut) {
                            isSidebarVisible = false
                    }
                    }
                }
                // 사이드바
                SideBarView()
                    .frame(width: UIScreen.main.bounds.width * 0.6) // 화면 너비의 80%로 설정
                    .offset(x: isSidebarVisible ? 0 : 900, y: 0) // 동적으로 설정
                    .animation(.easeInOut)
                    .navigationViewStyle(DoubleColumnNavigationViewStyle())
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                }
                
            }
        }
    }
    
    
}
#Preview {
    MainBarView()
}
