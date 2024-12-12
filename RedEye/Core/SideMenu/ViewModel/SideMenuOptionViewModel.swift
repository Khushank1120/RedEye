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
    case settings
    case messages
    
    var title: String {
        switch self {
        case .trips: return "Trips"
        case .wallet: return "Huskies"
        case .huskycard: return "Husky Card"
        case .settings: return "Settings"
        case .messages: return "Messages"
        }
    }
    
    var imageName: String {
        switch self {
        case .trips: return "list.bullet.rectangle"
        case .wallet: return "creditcard"
        case .huskycard: return "qrcode"
        case .settings: return "gear"
        case .messages: return "bubble.left"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
