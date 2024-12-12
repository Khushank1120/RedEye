//
//  SideMenuView.swift
//  RedEye
//
//  Created by Khushank on 12/11/24.
//

import SwiftUI

struct SideMenuView: View {
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
                        Text ("Khushank")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text ("TEST@gmail.com")
                            .accentColor(.black)
                            .opacity(0.8)
                    }
                }
                
                // become a driver
                VStack(alignment: .leading, spacing: 16) {
                    Text("Do more with your account")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "dollarsign.square")
                            .font(.title2)
                            .imageScale(.medium)
                        
                        Text("Make Money While Driving")
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
                    SideMenuOptionView(viewModel: viewModel)
                        .padding()
                    
                }
            }
            Spacer()
        }
        .padding(.top, 32)
    }
}

#Preview {
    SideMenuView()
}
