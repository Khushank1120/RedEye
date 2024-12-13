//
//  SavedLocation.swift
//  RedEye
//
//  Created by Khushank on 12/13/24.
//

import Firebase

struct SavedLocation: Codable {
    let title: String
    let address: String
    let coordinates: GeoPoint
    
}
