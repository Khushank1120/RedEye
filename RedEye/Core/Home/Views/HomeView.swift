//
//  HomeView.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @State private var showSideMenu = false
    //    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                LoginView()
            } else if let user = authViewModel.currentUser {
                NavigationStack {
                    ZStack {
                        if showSideMenu {
                            SideMenuView(user: user)
                        }
                        mapView
                            .offset(x: showSideMenu ? 300 : 0)
                            .shadow(color: showSideMenu ? .black : .clear, radius: 10)
                    }
                    .onAppear {
                        showSideMenu = false
                    }
                }
            }
        }
    }
}

extension HomeView {
    var mapView: some View {
        ZStack(alignment: .bottom) {
            ZStack (alignment: .top){
                RedEyeMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                if mapState == .searchingForLocation {
                    LocationSearchView()
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                        }
                }
                MapViewActionButton(mapState: $mapState, showSideMenu: $showSideMenu)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            if let user = authViewModel.currentUser {
                if user.accountType == .personal {
                    if mapState == .locationSelected || mapState == .polyLineAdded {
                        RideRequestView()
                            .transition(.move(edge: .bottom))
                    } else if mapState == .tripRequested {
                        TripLoadingView()
                            .transition(.move(edge: .bottom))
                    } else if mapState == .tripAccepted {
                        TripAcceptedView()
                            .transition(.move(edge: .bottom))
                    } else if mapState == .tripRejected {
                            // show trip rejected view
                        }
                } else {
                    if let trip = homeViewModel.trip {
                        if mapState == .tripRequested {
                            AcceptTripView(trip: trip)
                                .transition(.move(edge: .bottom))
                        } else if mapState == .tripAccepted {
                            PickupPassengerView(trip: trip)
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation){
            location in
            if let location = location {
                homeViewModel.userLocation = location
            }
        }
        .onReceive(homeViewModel.$selectedRedEyeLocation) { location in
            if location != nil {
                self.mapState = .locationSelected
            }
        }
        .onReceive(homeViewModel.$trip) { trip in
            guard let trip = trip else { return }
            
            withAnimation(.spring){
                switch trip.state {
                case .requested:
                    self.mapState = .tripRequested
                case .rejected:
                    self.mapState = .tripRejected
                case .accepted:
                    self.mapState = .tripAccepted
                }
            }
        }
    }
}

//#Preview {
//    HomeView()
//        .environmentObject(AuthViewModel())
//}
