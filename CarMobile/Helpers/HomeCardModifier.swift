//
//  HomeCardModifier.swift
//  CarMobile
//
//  Created by white4ocolate on 15.12.2024.
//

import Foundation
import SwiftUI

struct HomeCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(colors: [.darkBlue, .clear],
                               startPoint: .bottom,
                               endPoint: .top)
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                    .opacity(0.5))
            .padding(.horizontal)
            .padding(.vertical, 5)

    }
}
