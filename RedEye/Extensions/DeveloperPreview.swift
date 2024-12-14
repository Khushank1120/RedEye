//
//  DeveloperPreview.swift
//  RedEye
//
//  Created by Khushank on 12/13/24.
//

import Foundation
import SwiftUI
import Firebase


class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let mockTrip = Trip(id: NSUUID().uuidString, passengerUid: NSUUID().uuidString, driverUid: NSUUID().uuidString, passengerName: "Khushank", driverName: "Driver 1", passengerLocation: .init(latitude: 37.38, longitude: -122.05), driverLocation: .init(latitude: 37.38, longitude: -122.05), pickupLocationName: "Apple Campus", dropoffLocationName: "Starbucks", pickupLocationAddress: "123 Strabuck Ave", pickupLocation: .init(latitude: 37.456, longitude: -122.15), dropoffLocation: .init(latitude: 37.042, longitude: -122.2), tripCost: 47.0)
    
    let mockUser = User(
        fullname: "Khushank",
        email: "khushank@redeye.io",
        nuid: "0012100012",
        uid: NSUUID().uuidString,
        coordinates: GeoPoint(latitude: 37.38, longitude: -122.05),
        accountType: .personal,
        homeLocation: nil,
        workLocation: nil
    )
}

