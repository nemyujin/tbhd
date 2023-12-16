//
//  TBHDApp.swift
//  TBHD
//
//  Created by tbhd on 2023/10/31.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TBHDApp: App {
    @StateObject var locationManager = LocationManager() // LocationManager를 생성하고 상태 객체로 설정
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //프로젝트 모든 View에서 @EnvironmentObject 프로퍼티 래퍼를 사용하여 해당 변수를 참조할 수 있게 해준다.
    @StateObject var viewModel: ViewModel = ViewModel()
    @StateObject var spotVM = SpotViewModel()
    
    init() {
            // Kakao SDK 초기화
            KakaoSDK.initSDK(appKey:"8d132854a6b3578a0cce95a51d83c512")
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
                .environmentObject(viewModel)
                .environmentObject(SpotViewModel()) // SpotViewModel을 환경 객체로 설정
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
