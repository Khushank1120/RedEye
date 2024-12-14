//
//  MapViewState.swift
//  RedEye
//
//  Created by Khushank on 12/4/24.
//

import Foundation

enum MapViewState {
    case noInput
    case locationSelected
    case searchingForLocation
    case polyLineAdded
    case tripRequested
    case tripRejected
    case tripAccepted
    case tripCancelledByPassenger
    case tripCancelledByDriver
}
