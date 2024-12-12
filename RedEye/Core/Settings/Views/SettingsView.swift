//
//  SettingsView.swift
//  RedEye
//
//  Created by Khushank on 12/12/24.
//

import SwiftUI

struct SettingsView: View {
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
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text ("Khushank")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text ("test@test.com")
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
                    SavedLocationRowView(imageName: "house.circle.fill", title: "Home", subtitle: "Add Home")
                    SavedLocationRowView(imageName: "archivebox.circle.fill", title: "Work", subtitle: "Add Work")
                }
                
                Section("Settings") {
                    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
                    SettingsRowView(imageName: "dollarsign.circle.fill", title: "Husky Points Balance", tintColor: Color(.systemGreen))
                }
                
                Section("Account") {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemRed))
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}


