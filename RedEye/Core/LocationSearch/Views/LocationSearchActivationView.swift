//
//  LocationSearchActivationView.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            
            Image(systemName: "magnifyingglass")
                .frame(width: 10, height: 10)
                .padding(.horizontal, 20)

            Text("Where to?")
                .foregroundColor(Color(.darkGray))
                .bold()
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 2)
        )
    }
}

#Preview {
    LocationSearchActivationView()
}

//import SwiftUI
//
//struct LocationSearchActivationView: View {
//    var body: some View {
//        VStack {
//            // Search bar
//            HStack {
//                Image(systemName: "magnifyingglass") // Search icon
//                    .foregroundColor(.black)
//                    .padding(.leading)
//                
//                Text("Where to?")
//                    .font(.headline)
//                    .bold()
//                    .foregroundColor(.black)
//                
//                Spacer()
//                Spacer()
//
//            }
//            .frame(height: 50)
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            .padding(.horizontal)
//            .padding(.top, 8)
//            
//            // Address options
//            ScrollView() {
//                HStack {
//                    Image(systemName: "bag.fill") // Work icon
//                        .foregroundColor(.red)
//                        .frame(width: 24, height: 24)
//                    
//                    Text("Tap to add your work address")
//                        .foregroundColor(.black)
//                    
//                    Spacer()
//                }
//                
//                HStack {
//                    Image(systemName: "house.fill") // Home icon
//                        .foregroundColor(.red)
//                        .frame(width: 24, height: 24)
//                    
//                    Text("Home")
//                        .foregroundColor(.black)
//                    
//                    Spacer()
//                }
//                
//                HStack {
//                    Image(systemName: "clock.fill") // Recent icon
//                        .foregroundColor(.red)
//                        .frame(width: 24, height: 24)
//                    
//                    Text("Northeastern University, Forsyth St, Boston...")
//                        .foregroundColor(.black)
//                        .lineLimit(1)
//                    
//                    Spacer()
//                    
//                    Image(systemName: "heart")
//                        .foregroundColor(.red)
//                }
//            }
//            .padding(.horizontal)
//            .padding(.top, 16)
//            .padding(.bottom, 16)
//            
//            Spacer()
//        }
//        .background(Color.white)
//        .edgesIgnoringSafeArea(.bottom)
//        .frame(height: 250)
//        .cornerRadius(12)
//    }
//}
//
//#Preview {
//    LocationSearchActivationView()
//}
