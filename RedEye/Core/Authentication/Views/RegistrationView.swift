//
//  RegistrationView.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullname = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .imageScale(.medium)
                        .padding()
                }
                
                Text("Create New Account")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 250)
                
                Spacer()
                
                VStack {
                    VStack(spacing: 26) {
                        CustomInputField(text: $fullname, title: "Full Name", placeholder: "Enter Your Name")
                        CustomInputField(text: $fullname, title: "NU ID", placeholder: "Enter Your Northeastern University ID")
                        CustomInputField(text: $email, title: "Email", placeholder: "Enter You Email")
                        CustomInputField(text: $password, title: "Password", placeholder: "Enter Your Password")
                        
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        HStack {
                            Text("SIGN UP")
                                .foregroundColor(.black)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    }
                    .background(Color.white)
                    .cornerRadius(11)
                    
                    Spacer()
                    
                }
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    RegistrationView()
}
