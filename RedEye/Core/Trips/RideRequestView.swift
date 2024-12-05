//
//  RideRequestView.swift
//  RedEye
//
//  Created by Khushank on 12/4/24.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .redEye
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 10)
            
            // trip info view
            HStack{
                VStack{
                    Image(systemName: "arrow.down")
                        .foregroundColor(Color(.systemGray))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color(.cyan))
                        .frame(width: 8, height: 8)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current Location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("1:30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("Northeastern University")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Text("1:45 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            // ride type selection

            Text("AVAILABLE RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 22) {
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image (type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 2){
                                Text(type.description)
                                    .font(.system(size: 13, weight: .semibold))
                                Text("Husky: 12")
                                    .font(.system(size: 13, weight: .semibold))
                            }
                            .padding()
                        }
                        .frame(width: 102, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectedRideType ? 1.19 : 1.0)
                        .cornerRadius(11)
                        .onTapGesture {
                            withAnimation(.spring()){
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            // payment ride button
            
            HStack(spacing: 12) {
                Text("Husky Card")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.cyan)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("*** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // request ride button
            
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.cyan)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(12)
    }
}

#Preview {
    RideRequestView()
}
