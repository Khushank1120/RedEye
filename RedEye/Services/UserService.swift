//
//  UserService.swift
//  RedEye
//
//  Created by Khushank on 12/13/24.
//

import Foundation
import Firebase
import FirebaseAuth

class UserService: ObservableObject {
    static let shared = UserService()
    @Published var user: User?
    
    init() {
        print("DEBUG: Did not fetch user service")
        fetchUser()
    }
    
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            print("DEBUG: Fetching User")
            guard let snapshot = snapshot  else { return }
            guard let user = try? snapshot.data(as: User.self) else { return }
            self.user = user
        }
    }
}
    
//    static func fetchUser(completion: @escaping (User) -> Void){
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
//            guard let snapshot = snapshot  else { return }
//            
//            guard let user = try? snapshot.data(as: User.self) else { return }
//            completion(user)
//            
//        }
//    }
//}
