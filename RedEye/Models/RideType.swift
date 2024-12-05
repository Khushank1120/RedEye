//
//  RideType.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case redEye
    case blackEye
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .redEye: return "Red EYE"
        case .blackEye: return "Black EYE"
        }
    }
    
    var imageName: String {
        switch self {
        case .redEye: return "red-eye"
        case .blackEye: return "yellow-eye"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .redEye: return 5
        case .blackEye: return 10
        }
    }
    
    func computeHuskyPrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .redEye: return distanceInMiles * 1.5 + baseFare
        case .blackEye: return distanceInMiles * 2.0 + baseFare
        }
    }
}
