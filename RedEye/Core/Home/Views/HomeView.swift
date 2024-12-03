//
//  HomeView.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack (alignment: .top){
            RedEyeMapViewRepresentable()
                .ignoresSafeArea()
            
            LocationSearchActivationView()
                .padding(.top, 72)
            
            MapViewActionButton()
                .padding(.leading)
                .padding(.top, 4)
        }
       
    }
}

#Preview {
    HomeView()
}
