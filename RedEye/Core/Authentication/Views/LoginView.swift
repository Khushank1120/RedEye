//
//  LoginView.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                
                // image and title
                
                VStack() {
                    Image("light_mode_icon")
                        .resizable()
                        .frame(width: 190, height: 190)
                    
                    Text("Northeastern University")
                        .foregroundColor(Color(.white))
                        .font(.largeTitle)
                }
                
                // input fields
                VStack (spacing: 32) {
                    
                    // input field 1
                    CustomInputField(text: $email, title: "Email Address", placeholder: "name@example.com")
                    
                    // input field 2
                    CustomInputField(text: $password, title: "Enter Password", placeholder: "Enter your password", isSecuredField: true)

                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.top)
                            .opacity(0.7)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // social sign in view
                
                VStack {
                    
                    // dividers + text
                    HStack(spacing: 24) {
                        Rectangle()
                            .frame(width: 60, height: 1)
                            .foregroundColor(Color(.white))
                            .opacity(0.5)

                        Text("Sign in with NU Account")
                            .foregroundColor(Color(.systemGray5))
                            .fontWeight(.semibold)
                            .opacity(0.8)
                        
                        
                        Rectangle()
                            .frame(width: 56, height: 1)
                            .foregroundColor(Color(.white))
                            .opacity(0.5)
                    }
                    
                    // sign up buttons
                    HStack {
                        Button {
                        } label: {
                            Image("outlook_icon")
                                .resizable()
                                .frame(width: 44, height: 44)
                        }
                    }
                }
                .padding(.vertical)
                
                Spacer()
                
                // sign in button
                Button {
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .foregroundColor(.black)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                }
                .background(Color.white)
                .cornerRadius(11)

                // sign up button
                
                Spacer()
                
                Button {
                } label: {
                    HStack {
                        Text("Don't have an accound ?")
                            .font(.system(size: 14))
                            .opacity(0.8)

                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .opacity(0.8)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
