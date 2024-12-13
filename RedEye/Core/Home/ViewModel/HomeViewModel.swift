//
//  HomeViewModel.swift
//  RedEye
//
//  Created by Khushank on 12/13/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

class HomeViewModel: ObservableObject {
    
    @Published var drivers = [User]()
    
    init()  {
        fetchDriver()
    }
    
    func fetchDriver() {
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let drivers = documents.compactMap({ try? $0.data(as: User.self)})
                self.drivers = drivers
                
//                let users = documents.compactMap { doc in
//                    let user = try? doc.data(as: User.self)
//                    return user
//                }
//                print("DEBUG: \(drivers)")
            }
    }
}
