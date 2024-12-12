//
//  AuthViewModel.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func signIn(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            //            print("DEBUG: Sign in user successfully")
            //            print("DEBUG: User id \(result?.user.uid)")
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String, nuid: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign up with error \(error.localizedDescription)")
                return
            }
            guard let firebaseUser = result?.user else { return }
            self.userSession = firebaseUser
            
            let user = User(fullname: fullname, email: email, nuid: nuid, uid: firebaseUser.uid)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            
            Firestore.firestore().collection("users").document(firebaseUser.uid).setData(encodedUser)
            
            //            let data: [String: Any] = [ \\ Encoding helps us not to use this
            //                "fullname": fullname,
            //                "email": email,
            //                "nuid": nuid,
            //                "uid": firebaseUser.uid,
            //
            //            ]
            //            print("DEBUG: Registered user successfully")
            //            print("DEBUG: User id \(result?.user.uid)")
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
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        //        guard let uid = Auth.auth().currentUser?.uid else { return } //2nd way to do the same thing
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot  else { return }
            
            guard let user = try? snapshot.data(as: User.self) else { return }
            self.currentUser = user
            
            //            print("DEBUG: User is \(user.fullname)")
        }
    }
}
