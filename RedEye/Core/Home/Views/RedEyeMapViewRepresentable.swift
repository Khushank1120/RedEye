//
//  RedEyeMapViewRepresentable.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import Foundation
import SwiftUI
import MapKit

struct RedEyeMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if let selectedLocation = locationViewModel.selectedLocation {
//            print("DEBUG: Selected Location \(selectedLocation)")
        }

    }
    
    func makeCoordinator() -> MapCoordinator {
            
        return MapCoordinator(parent: self)
    }
}


extension RedEyeMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate{
        let parent: RedEyeMapViewRepresentable
        
        init(parent: RedEyeMapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            parent.mapView.setRegion(region, animated: true)
        }
        
    }
}
