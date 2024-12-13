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
import FirebaseAuth
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var drivers = [User]()
    private let service = UserService.shared
    var currentUser: User?
    private var cancellables = Set<AnyCancellable>()

    init()  {
        fetchUser()
    }
    
    func fetchDrivers() {
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let drivers = documents.compactMap({ try? $0.data(as: User.self)})
                self.drivers = drivers

            }
    }
    
    func fetchUser() {
        service.$user
            .sink { user in
                guard let user = user else { return }
                self.currentUser = user
                guard user.accountType == .personal else { return }
                self.fetchDrivers()
            }
            .store(in: &cancellables)
    }
}
