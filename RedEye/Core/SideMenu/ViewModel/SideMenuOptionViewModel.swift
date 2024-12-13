//
//  SideMenuOptionViewModel.swift
//  RedEye
//
//  Created by Khushank on 12/12/24.
//

import Foundation

enum SideMenuOptionViewModel: Int, CaseIterable, Identifiable {
    case trips
    case wallet
    case huskycard
    case messages
    case settings
    
    var title: String {
        switch self {
        case .trips: return "Trips"
        case .wallet: return "Huskies"
        case .huskycard: return "Husky Card"
        case .messages: return "Messages"
        case .settings: return "Settings"
        }
    }
    
    var imageName: String {
        switch self {
        case .trips: return "list.bullet.rectangle"
        case .wallet: return "creditcard"
        case .huskycard: return "qrcode"
        case .messages: return "bubble.left"
        case .settings: return "gear"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
