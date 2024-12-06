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
    
    func signIn(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
//            print("DEBUG: Sign in user successfully")
//            print("DEBUG: User id \(result?.user.uid)")
            self.userSession = result?.user
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String, nuid: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign up with error \(error.localizedDescription)")
                return
            }
            print("DEBUG: Registered user successfully")
            print("DEBUG: User id \(result?.user.uid)")
            self.userSession = result?.user
        }
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch let error {
            print("DEBUG: Failed to sign out user: \(error.localizedDescription)")
        }
    }
}
