//
//  User.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import Foundation
import Firebase

enum AccountType: Int, Codable {
    case personal
    case driver
}

struct User: Codable {
    let fullname: String
    let email: String
    let nuid: String
    let uid: String
    var coordinates: GeoPoint

    // husky points implementation
//    let huskyPoints: String
    
    let accountType: AccountType
    var homeLocation: SavedLocation?
    var workLocation: SavedLocation?
}
