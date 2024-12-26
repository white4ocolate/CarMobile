//
//  TabBarModifier.swift
//  CarMobile
//
//  Created by white4ocolate on 26.12.2024.
//

import Foundation
import SwiftUI

struct TabBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(colors: [.darkBlue, .clear],
                               startPoint: .bottom,
                               endPoint: .top)
                .clipShape(
                    RoundedRectangle(cornerRadius: 100)
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.gray, lineWidth: 1)
                    /*.opacity(1)*/)
            .padding()
    }
}
