//
//  AuthViewModel.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import Foundation
import FirebaseAuth
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
}

