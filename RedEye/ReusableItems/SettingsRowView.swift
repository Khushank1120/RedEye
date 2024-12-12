//
//  SettingsRowView.swift
//  RedEye
//
//  Created by Khushank on 12/12/24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(tintColor)
            
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(Color.theme.primaryTextColor)
        }
        .padding(3)
    }
}

#Preview {
    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemCyan))
}
