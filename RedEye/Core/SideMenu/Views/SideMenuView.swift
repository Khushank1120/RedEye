//
//  SideMenuView.swift
//  RedEye
//
//  Created by Khushank on 12/11/24.
//

import SwiftUI

struct SideMenuView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    var body: some View {
        VStack(spacing: 40) {
            // header view
            VStack(alignment: .leading, spacing: 32){
                // user info
                HStack {
                    Image("profile-picture")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text (user.fullname)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text (user.email)
                            .font(.system(size: 14))
                            .accentColor(Color.theme.primaryTextColor)
                            .opacity(0.8)
                    }
                }
                
                //  Queue
                VStack(alignment: .leading, spacing: 16) {
                    Text("Do more with your account")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "person.badge.clock")
                            .font(.title2)
                            .imageScale(.medium)
                        
                        Text("Check wait time")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(6)
                    }
                }
                
                Rectangle()
                    .frame(width: 296, height: 1)
                    .opacity(0.7)
                    .foregroundColor(Color(.separator))
                    .shadow(color: Color.black.opacity(0.7), radius: 4)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            
            
            VStack {
                ForEach(SideMenuOptionViewModel.allCases) { viewModel in
                    NavigationLink(value: viewModel) {
                        SideMenuOptionView(viewModel: viewModel)
                            .padding()
                    }
                }
            }
            .navigationDestination(for: SideMenuOptionViewModel.self) {
                viewModel in
                switch viewModel {
                case .trips:
                    Text("Trips")
                case .wallet:
                    Text("Wallet")
                case .huskycard:
                    Text("Husky Card")
                case .messages:
                    Text("Messages")
                case .settings:
                    SettingsView(user: user)
                }
            }
            Spacer()
        }
        .padding(.top, 32)
    }
}

#Preview {
    NavigationStack     {
        SideMenuView(user: User(fullname: "Khushank Mistry", email: "khushank@gmail.com", nuid: "001122000", uid: "123334566"))
    }
}
