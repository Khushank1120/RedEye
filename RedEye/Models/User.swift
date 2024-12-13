//
//  User.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import Foundation

struct User: Codable {
    let fullname: String
    let email: String
    let nuid: String
    let uid: String
    var homeLocation: SavedLocation?
    var workLocation: SavedLocation?
}
