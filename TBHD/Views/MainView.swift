//
//  MainView.swift
//  TBHD
//
//  Created by tbhd on 2023/10/31.
//

import SwiftUI

struct MainView: View {
    let cards = MainData.shared.cards
    
    let pops = MainData.shared.pops
    
    let popsmemo = MainData.shared.popsmemo
    
    let popsmemo2 = MainData.shared.popsmemo2
    // 동적으로 NavigationLink의 목적지를 설정하는 함수
    func getDestinationView(index: Int) -> some View {
        // index에 따라 다른 목적지 뷰를 반환
        if index == 0 {
            return AnyView(PopupView())
        } else if index == 1 {
            return AnyView(SeventeenPopupView())
        } else {
            return AnyView(DefaultPopupView())
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .trailing) {
                    
                    //배너
                    TabView {
                        ForEach(cards, id: \.name) { card in
                            ZStack {
                                Image(card.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 390, height: 412)
                                    .clipped()
                            }
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    .frame(width: 390, height: 412, alignment: .trailing)
                    
                    Spacer()
                        .frame(height: 48)
                    
                    // 주간 정보 업데이트,이번주에 뭐하지,더보기,미니배너
                    VStack(alignment: .leading, spacing: 16){
                        //주간 정보 업데이트,이번 주에 뭐 하지?,더 보기
                        VStack(alignment: .leading, spacing: 4)
                        {
                            
                            Text("주간 정보 업데이트")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black.opacity(0.6))
                            
                            Text("이번 주에 뭐 하지?")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color.black)
                            
                            Text("더 보기")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                .position(x:332, y:-12)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 0)
                        .frame(width: 390, height:42, alignment: .leading)
                        // 미니배너
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(pops.indices, id: \.self) { index in
                                    NavigationLink(destination: getDestinationView(index: index)) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            Image(pops[index].name)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 131, height: 131)
                                                .clipped()
                                                .cornerRadius(12)
                                            
                                            Text(popsmemo[index].name)
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                                        .weight(.semibold)
                                                )
                                                .foregroundColor(Color(red: 0.82, green: 0.53, blue: 1))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            HStack(alignment: .top, spacing: 12){
                                                Text(popsmemo2[index].name)
                                                    .font(
                                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                                            .weight(.medium)
                                                    )
                                                    .foregroundColor(Color.black)
                                                    .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .topLeading)
                                                
                                                Image(systemName:"heart")
                                                    .font(
                                                        Font.custom("SF Pro Display", size: 20)
                                                            .weight(.medium)
                                                    )
                                                    .foregroundColor(Color.black.opacity(0.2))
                                                    .frame(width: 25, alignment: .topLeading)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 0)
                            .padding(.vertical, 0)
                            .frame(width: 370, alignment: .topLeading)
                        }

                        Spacer()
                            .frame(height: 64)
                        
                        
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
