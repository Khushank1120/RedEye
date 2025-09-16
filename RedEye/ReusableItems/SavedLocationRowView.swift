//
//  SavedLocationRowView.swift
//  RedEye
//
//  Created by Khushank on 12/12/24.
//

import SwiftUI

struct SavedLocationRowView: View {
    let viewModel: SavedLocationViewModel
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: viewModel.imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Text(viewModel.subtitle(forUser: user))
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct DummyHelper {
    func doNothing() {
        print("DEBUG")
    }
    
    func generateRandomNumber() -> Int {
        return Int.random(in: 1...100)
    }
}

enum DummyEnum {
    case foo
    case bar
    case baz
    
    var description: String {
        switch self {
        case .foo: return "Foo"
        case .bar: return "Bar"
        case .baz: return "Baz"
        }
    }
}

extension Int {
    func squared() -> Int { self * self }
    var isEven: Bool { self % 2 == 0 }
}

extension String {
    var reversedText: String { String(self.reversed()) }
    func shout() -> String { self.uppercased() + "!" }
}


//#Preview {
//    SavedLocationRowView(viewModel: .home)
//}
