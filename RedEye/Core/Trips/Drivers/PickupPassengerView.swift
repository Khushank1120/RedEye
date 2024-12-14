//
//  PickupPassengerView.swift
//  RedEye
//
//  Created by Khushank on 12/14/24.
//

import SwiftUI

struct PickupPassengerView: View {
    let trip: Trip
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 10)
            
            VStack {
                HStack {
                    Text("Pick Up \(trip.passengerName) at \(trip.dropoffLocationName)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .frame(height: 44)
                    
                    Spacer()
                    
                    VStack {
                        Text("\(trip.travelTimeToPassenger)")
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
            VStack {
                HStack {
                    Image("profile-picture")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(trip.passengerName)
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
                    
                    VStack(spacing: 6){
                        Text("Husky Points")
                        Text("\(trip.tripCost.toCurrency())")
                            .font(.system(size: 24, weight: .semibold))
                    }
                }
                Divider()
            }
            .padding()

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

//#Preview {
//    PickupPassengerView()
//}
