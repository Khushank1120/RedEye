//
//  SavedLocationSearchView.swift
//  RedEye
//
//  Created by Khushank on 12/12/24.
//

import SwiftUI

struct SavedLocationSearchView: View {
    @State private var text = ""
    @StateObject var viewModel = LocationSearchViewModel()
    let config: SavedLocationViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: -10){
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .imageScale(.medium)
                    .padding(.leading)
                
                TextField("Search for a location..",
                          text: $viewModel.queryFragment)
                .frame(height: 32)
                .padding(.leading)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal)
            }
            .padding(.top)
            Spacer()
            LocationSearchResultsView(viewModel: viewModel, config: .saveLocation(config))
        }
        .navigationTitle(config.subtitle)
    }
}
//#Preview {
//    NavigationStack {
//        SavedLocationSearchView()
//    }
//}
