//
//  RedEyeApp.swift
//  RedEye
//
//  Created by Khushank on 12/3/24.
//

import SwiftUI

@main
struct RedEyeApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
