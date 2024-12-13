//
//  SettingsView.swift
//  RedEye
//
//  Created by Khushank on 12/12/24.
//

import SwiftUI

struct SettingsView: View {
    private let user: User
    @EnvironmentObject var viewModel: AuthViewModel
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    // user info header
                    HStack {
                        Image("profile-picture")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text (user.fullname)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text (user.email)
                                .font(.system(size: 14))
                                .accentColor(Color.theme.primaryTextColor)
                                .opacity(0.8)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
                Section("Favourites") {
                    ForEach(SavedLocationViewModel.allCases) { viewModel in
                        NavigationLink {
                            SavedLocationSearchView(config: viewModel)
                        } label: {
                            SavedLocationRowView(viewModel: viewModel, user: user)
                        }
                    }
                }
            
            Section("Settings") {
                SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
                SettingsRowView(imageName: "dollarsign.circle.fill", title: "Husky Points Balance", tintColor: Color(.systemGreen))
            }
            
            Section("Account") {
                SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemRed))
                    .onTapGesture {
                        viewModel.signout()
//                            print("DEBUG: Sign Out")
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        SettingsView(user: User(fullname: "Khushank", email: "test@test.com", nuid: "002200111", uid: "112233445"))
    }
}


