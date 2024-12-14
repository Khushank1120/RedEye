//
//  MapViewActionButton.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @Binding var showSideMenu: Bool
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Button{
            withAnimation(.spring()){
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            showSideMenu.toggle()
//                authViewModel.signout()
//            print("DEBUG: No Input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polyLineAdded,
                .tripRejected,
                .tripAccepted,
                .tripRequested,
                .tripCancelledByDriver,
                .tripCancelledByPassenger:
            mapState = .noInput
            viewModel.selectedRedEyeLocation = nil
//            print("DEBUG: Clear map view..")
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected, .polyLineAdded,
                .tripRejected,
                .tripRequested,
                .tripAccepted,
                .tripCancelledByDriver,
                .tripCancelledByPassenger:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        }
    }
}

#Preview {
    MapViewActionButton(mapState: .constant(.noInput), showSideMenu: .constant(false))
}
