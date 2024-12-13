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
import Combine

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
        
    private let service = UserService.shared
    private var cancellables = Set<AnyCancellable>()

    
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
            self.fetchUser()
            //            print("DEBUG: Sign in user successfully")
            //            print("DEBUG: User id \(result?.user.uid)")
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String, nuid: String){
        guard let location = LocationManager.shared.userLocation else { return }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign up with error \(error.localizedDescription)")
                return
            }
            guard let firebaseUser = result?.user else { return }
            self.userSession = firebaseUser
            
            let user = User(
                fullname: fullname,
                email: email,
                nuid: nuid,
                uid: firebaseUser.uid,
                coordinates: GeoPoint(latitude: location.latitude, longitude: location.longitude),
                accountType: .driver
            )
            
            self.currentUser = user // eliminating the unnecessary API call
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
        service.$user
            .sink { user in
                self.currentUser = user
            }
            .store(in: &cancellables)
    }
}
