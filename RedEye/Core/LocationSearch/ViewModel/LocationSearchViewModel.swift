//
//  LocationSearch.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject{

    // Mark: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation: String?

    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
//            print("DEBUG: Query Fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
    
    // Mark: Helpers
    
    func selectLocation(_ location: String){
        self.selectedLocation = location
        
        print("DEBUG: Selected Location is \(self.selectedLocation)")
    }
    
}

// Mark: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
