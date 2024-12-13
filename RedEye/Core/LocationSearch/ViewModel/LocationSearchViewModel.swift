//
//  LocationSearch.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import Foundation
import MapKit

enum LocationResultsViewConfig {
    case ride
    case savedLocation
}

class LocationSearchViewModel: NSObject, ObservableObject{

    // Mark: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedRedEyeLocation: RedEyeLocation?
    @Published var pickupTime: String?
    @Published var dropOffTime: String?

    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
//            print("DEBUG: Query Fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    
    // Mark: Lifecycle

    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
    
    // Mark: Helpers
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion, config: LocationResultsViewConfig){
        switch config {
        case .ride:
            locationSearch(forLocalSearchCompletion: localSearch) { response, error in
                if let error = error {
                    print("DEBUG: Location search failed with error \(error.localizedDescription)")
                    return
                }
                guard let item = response?.mapItems.first else { return }
                let coordinate = item.placemark.coordinate
                self.selectedRedEyeLocation = RedEyeLocation(title: localSearch.title, coordinate: coordinate)
                print("DEBUG: Location coordinates \(coordinate)")
            }
        case .savedLocation:
            print("DEBUG: Saving location")
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
        
    }
    func computeRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedRedEyeLocation?.coordinate else { return 0.0 }
        guard let userCoordinate = self.userLocation else { return 0.0 }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: destCoordinate.latitude, longitude: destCoordinate.longitude)
        
        let tripDistanceInMeters = userLocation.distance(from: destination)
        return type.computeHuskyPrice(for: tripDistanceInMeters)
        
    }
    
    func getDestinationRoute(from userLocation: CLLocationCoordinate2D,
                             to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void){
        
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            if let error = error {
                print("DEBUG: Failed to get directions with error \(error.localizedDescription)")
                return
            }
            
            guard let route = response?.routes.first else { return }
            self.configurePickupAndDropoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickupAndDropoffTimes(with expectedTravelTime: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickupTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
}

// Mark: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
