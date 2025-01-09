//
//  View.swift
//  CarMobile
//
//  Created by white4ocolate on 15.12.2024.
//

import Foundation
import SwiftUI

enum ModifierType {
    case homeCard
    case tabBar
}

extension View {
    func applyModifier(type: ModifierType) -> some View {
        self.modifier(Modifier(type: type))
    }
}
