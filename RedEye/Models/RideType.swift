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
}
