//
//  ViewModel.swift
//  TBHD
//
//  Created by tbhd on 2023/11/06.
//

import Foundation
import Firebase
import FirebaseAuth
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth

class ViewModel: ObservableObject {
    @Published var state: SignInState = .signedOut
    
    enum SignInState{
        case signedIn
        case signedOut
    }
    
    
    //로그인
    func emailAuthSignIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }

            if let user = result?.user {
                // 사용자 이름 가져오기
                let userName = user.displayName ?? "Unknown"

                // 로그 추가
                print("사용자 이름: \(userName)")

                // 로그인 성공 후 상태 업데이트
                self.state = .signedIn
            }
        }
    }


    // 회원가입
    func emailAuthSignUp(email: String, userName: String, password: String, completion: (() -> Void)?) {
           Auth.auth().createUser(withEmail: email, password: password) { result, error in
               if let error = error {
                   print("error: \(error.localizedDescription)")
               }
               if let user = result?.user {
                   // 사용자 이름 설정
                   let changeRequest = user.createProfileChangeRequest()
                   changeRequest.displayName = userName
                   changeRequest.commitChanges { error in
                       if let error = error {
                           print("Failed to set display name: \(error.localizedDescription)")
                       }
                   }
               }

               completion?()
           }
       }
    
    //카카오 로그인
    // MARK: - KakaoAuth SignIn Function
    func kakaoAuthSignIn() {
        if AuthApi.hasToken() { // 발급된 토큰이 있는지
            UserApi.shared.accessTokenInfo { _, error in // 해당 토큰이 유효한지
                if let error = error { // 에러가 발생했으면 토큰이 유효하지 않다.
                    self.openKakaoService()
                } else { // 유효한 토큰
                    self.loadingInfoDidKakaoAuth()
                }
            }
        } else { // 만료된 토큰
            self.openKakaoService()
        }
    }

    
    func openKakaoService() {
        if UserApi.isKakaoTalkLoginAvailable() { // 카카오톡 앱 이용 가능한지
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in // 카카오톡 앱으로 로그인
                if let error = error { // 로그인 실패 -> 종료
                    print("Kakao Sign In Error: ", error.localizedDescription)
                    return
                }
                
                _ = oauthToken // 로그인 성공
                self.loadingInfoDidKakaoAuth() // 사용자 정보 불러와서 Firebase Auth 로그인하기
            }
        } else { // 카카오톡 앱 이용 불가능한 사람
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in // 카카오 웹으로 로그인
                if let error = error { // 로그인 실패 -> 종료
                    print("Kakao Sign In Error: ", error.localizedDescription)
                    return
                }
                _ = oauthToken // 로그인 성공
                self.loadingInfoDidKakaoAuth() // 사용자 정보 불러와서 Firebase Auth 로그인하기
            }
        }
    }
    func loadingInfoDidKakaoAuth() {
        UserApi.shared.me { kakaoUser, error in
            if let error = error {
                print("카카오톡 사용자 정보 불러오는데 실패했습니다. Error: \(error.localizedDescription)")
                return
            }

            if let email = kakaoUser?.kakaoAccount?.email,
               let password = kakaoUser?.id,
               let userName = kakaoUser?.kakaoAccount?.profile?.nickname {
                // 사용자 정보가 올바르게 가져와진 경우에만 이 부분으로 진입
                print("Email: \(email), Password: \(password), UserName: \(userName)")

                self.emailAuthSignUp(email: email, userName: userName, password: "\(password)") {
                    self.emailAuthSignIn(email: email, password: "\(password)")
                }
            } else {
                print("카카오톡 사용자 정보 중 일부가 nil입니다.")
            }
        }
    }

    
    func handleKakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    func logout() {
        // Firebase에서 로그아웃
        do {
            try Auth.auth().signOut()
        } catch {
            print("Firebase 로그아웃 오류: \(error.localizedDescription)")
        }

        // Kakao에서 로그아웃
        handleKakaoLogout()
        
        // 로그아웃 후 상태를 업데이트하거나 필요한 경우 기타 작업 수행
        state = .signedOut
    }
}
