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
