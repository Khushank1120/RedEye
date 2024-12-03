//
//  MapViewActionButton.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

struct MapViewActionButton: View {
    var body: some View {
        Button{
            
        } label: {
            Image(systemName: "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MapViewActionButton()
}
