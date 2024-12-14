//
//  TripLoadingView.swift
//  RedEye
//
//  Created by Khushank on 12/14/24.
//

import SwiftUI

struct TripLoadingView: View {
    var body: some View {
        VStack{
            Text("Finding your REDEYE trip")
        }
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

#Preview {
    TripLoadingView()
}
