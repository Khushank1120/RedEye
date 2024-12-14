//
//  RedEyeLocation.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import Foundation
import CoreLocation

struct RedEyeLocation: Identifiable {
    let id = UUID().uuidString
    let title: String
    let coordinate: CLLocationCoordinate2D
}
