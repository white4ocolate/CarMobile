//
//  View.swift
//  CarMobile
//
//  Created by white4ocolate on 15.12.2024.
//

import Foundation
import SwiftUI

extension View {
    func applyHomeCardStyle() -> some View {
        self.modifier(HomeCardModifier())
    }

    func applyTabBardStyle() -> some View {
        self.modifier(TabBarModifier())
    }
}
