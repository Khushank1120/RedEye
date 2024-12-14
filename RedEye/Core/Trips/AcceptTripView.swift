//
//  AcceptTripView.swift
//  RedEye
//
//  Created by Khushank on 12/13/24.
//

import SwiftUI
import MapKit

struct AcceptTripView: View {
    @State private var region: MKCoordinateRegion
    
    init() {
        let center = CLLocationCoordinate2D(latitude: 37.3346, longitude: 122.0090)
        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        self.region = MKCoordinateRegion(center: center, span: span)
    }
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 10)
            
            // Would you like to pickup view
            VStack {
                HStack {
                    Text("Would you like to pickup this student")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .frame(height: 44)
                    
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
            // user info view
            
            VStack {
                HStack {
                    Image("profile-picture")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("John Doe")
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
                        Text("5")
                            .font(.system(size: 24, weight: .semibold))
                    }
                }
                Divider()
            }
            .padding()
            
            // pickup location info view
            VStack {
                // trip location info
                HStack {
                    // address info
                    VStack(alignment: .leading, spacing: 6){
                        Text("Apple Campus")
                            .font(.headline)
                        
                        Text("Infinity Loop 1, Santa Clara, CA")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer()
                    
                    // distance
                    VStack(alignment: .leading, spacing: 6){
                        Text("1.5")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("mi")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding()
                // map
                Map(coordinateRegion: $region)
                    .frame(height: 220)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.6), radius: 10)
                    .padding()
                
                // divider
                Divider()
            }
            
            // action buttons
            HStack {
                Button {
                    
                } label: {
                    Text("Reject")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 32, height: 56)
                        .background(Color(.systemRed))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Accept")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 32,
                               height: 56)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

#Preview {
    AcceptTripView()
}
