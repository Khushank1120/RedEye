//
//  TripAcceptedView.swift
//  RedEye
//
//  Created by Khushank on 12/14/24.
//

import SwiftUI

struct TripAcceptedView: View {
    var body: some View {
        VStack{
            Text("Your REDEYE is on the way")
                .padding()
        }
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

#Preview {
    TripAcceptedView()
}
