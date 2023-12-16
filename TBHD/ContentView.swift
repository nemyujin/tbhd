//
//  ContentView.swift
//  TBHD
//
//  Created by tbhd on 2023/10/31.
//


import SwiftUI
import Firebase
import FirebaseAuth
import KakaoSDKAuth
import KakaoSDKUser

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        VStack {
            if viewModel.state == .signedIn {
                BarView()
            } else {
                SignInView()
            }
        }
        .onAppear {
            print("현재 사용자: \(Auth.auth().currentUser)")
            
            // 앱이 시작될 때 로그인 상태를 확인하여 자동으로 로그인 처리
            if let user = Auth.auth().currentUser {
                print("사용자가 로그인되어 있습니다.")
                viewModel.state = .signedIn

                // 여기서 필요에 따라 추가적인 초기화 작업을 수행할 수 있습니다.

            } else {
                print("사용자가 로그인하지 않았습니다.")
                viewModel.state = .signedOut
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
