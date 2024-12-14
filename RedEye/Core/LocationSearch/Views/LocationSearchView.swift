//
//  LocationSearchView.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack{
            // header view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 3, height: 34)
                    
                    Rectangle()
                        .fill(.red)
                        .frame(width: 8, height: 8)
                    
                }
                VStack{
                    TextField("Current Location", text: $startLocationText)
                        .padding(.leading, 10)
                        .frame(height: 42)
                        .background(Color(
                            .systemGray5))
                        .cornerRadius(12)
                    
                    TextField("Where To?", text: $viewModel.queryFragment)
                        .padding(.leading, 10)
                        .frame(height: 42)
                        .background(Color(
                            .systemGray5))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // list view
            LocationSearchResultsView(viewModel: viewModel, config: .ride)
            
        }
        .background(Color.theme.backgroundColor)
        .background(.white)
    }
}

//#Preview {
//    LocationSearchView()
//}
