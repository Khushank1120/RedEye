//
//  LocationSearchView.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack{
            // header view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.red)
                        .frame(width: 6, height: 6)
                    
                }
                VStack{
                    TextField("Current Location", text: $startLocationText)
                        .padding(.leading, 10)
                        .frame(height: 32)
                        .background(Color(
                            .systemGray5))
                        .padding(.trailing)
                    
                    TextField("Where To?", text: $viewModel.queryFragment)
                        .padding(.leading, 10)
                        .frame(height: 32)
                        .background(Color(
                            .systemGray5))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
    
        // list view

        ScrollView{
            VStack(alignment: .leading){
                ForEach(viewModel.results, id: \.self){
                    result in
                    LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                        .onTapGesture {
                            viewModel.selectLocation(result)
                            mapState = .locationSelected
                        }
                    
                    }
                }
            }
        }
        .background(.white)
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
        .environmentObject(LocationSearchViewModel())
}
