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
    
    func registerUser(withEmail email: String, password: String, fullname: String, nuid: String){
//        print("DEBUG: email \(email)")
//        print("DEBUG: name \(fullname)")
//        print("DEBUG: nuid \(nuid)")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign up with error \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User id \(result?.user.uid)")
        }
    }
}
