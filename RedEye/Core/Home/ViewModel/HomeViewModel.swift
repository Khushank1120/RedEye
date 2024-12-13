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
    
    init()  {
        fetchDriver()
    }
    
    func fetchDriver() {
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let drivers = documents.map({ try? $0.data(as: User.self)})
                
                print("DEBUG: \(drivers)")
            }
    }
}
