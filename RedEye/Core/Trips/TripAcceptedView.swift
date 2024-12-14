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
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            VStack {
                HStack  {
                    Text("Meet your driver at Apple Campus for your trip to...")
                        .font(.body)
                        .frame(height: 44)
                        .lineLimit(2)
                        .padding(.trailing)
                    
                    Spacer()
                    VStack {
                        Text("10")
                            .bold()
                        
                        Text("Min")
                            .bold()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.blue))
                    .cornerRadius(10)
                    
                }
                .padding()
                Divider()
            }
            
            // pickup info view
            VStack {
                HStack {
                    Image("profile-picture")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Khushank")
                            .fontWeight(.bold)
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(.systemYellow))
                                .imageScale(.small)
                            Text("4.5")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    
                    // driver vehicle info
                    VStack (alignment: .center){
                        Image("red-eye")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 64)
                        
                        HStack {
                            Text("Red EYE")
                                .font(.system(size: 14, weight: .semibold))
                            Text("NEU 001")
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(width: 160)
                        .padding(.bottom)
                    }
                }
                Divider()
            }
            Button {
                print("DEBUG: Cancel trip")
            } label: {
                Text("CANCEL TRIP")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

#Preview {
    TripAcceptedView()
}
