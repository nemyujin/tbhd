//
//  SignInView.swift
//  TBHD
//
//  Created by tbhd on 2023/11/06.
//

import SwiftUI

struct SignInView: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var signInProcessing: Bool = false
    @EnvironmentObject var viewModel: ViewModel // ViewModel 주입

    var body: some View {
        NavigationView{
            NavigationStack {
                VStack(spacing: 15) {
                    
                    Image("login")
                      .foregroundColor(.clear)
                      .frame(width: 131, height: 131)
                      .cornerRadius(999)
                    
                    Text("  지금 특별활동과\n여행을 시작하세요!")
                        .font(.headline)
                     
                    
                    VStack {
                        TextField("이메일", text: $emailText)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                        SecureField("비밀번호", text: $passwordText)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .padding(.bottom, 30)
                    }
                    
                    // 로그인 접속중에 signInProcessing = false 이거나 유저 정보가 비어있다면
                    if signInProcessing {
                        ProgressView()
                    }
                    
                    
                    //(1)
                    VStack {
                        Button {
                            signInProcessing = true
                            viewModel.emailAuthSignIn(email: emailText, password: passwordText)
                            
                            
                        } label: {
                            Text("이메일 로그인")
                                .frame(width: 150)
                                .frame(height: 15)
                                .padding()
                                .foregroundColor(.white)
                                .background(emailText.isEmpty || passwordText.isEmpty == true ? .gray : .red)
                                .cornerRadius(10)
                            
                        }
                        .disabled(emailText.isEmpty || passwordText.isEmpty ? true : false)
                        
                        Button {
                            signInProcessing = true
                            viewModel.kakaoAuthSignIn()
                        } label: {
                            Image("kakao_login_medium_narrow").resizable().frame(width: 180, height: 45)
                            
                            
                        }
                    }
                    .padding(.bottom, 40)
                    
                    // 회원가입 View로 이동
                    HStack {
                        Text("아이디가 없으십니까?")
                        
                        NavigationLink {
                            SignUpView()
                        } label: {
                            HStack {
                                Text("지금 만드세요.")
                                Image(systemName: "arrow.up.forward")
                                
                            }
                        }
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    SignInView()
}
