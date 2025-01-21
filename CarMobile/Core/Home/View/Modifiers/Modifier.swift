//
//  Modifier.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

struct Modifier: ViewModifier {

    //MARK: - Properties
    @State var type: ModifierType

    private var cornerRadius: CGFloat {
        switch type {
        case .homeCard:
            return 20
        case .tabBar:
            return 22
        }
    }

    //MARK: - View
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(colors: [.darkBlue, .clear],
                               startPoint: .bottom,
                               endPoint: .top)
                .clipShape(
                    RoundedRectangle(cornerRadius: cornerRadius)
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.gray, lineWidth: 1)
                    .opacity(0.5)
            )
            .padding(.horizontal)
            .padding(.bottom, 5)
    }
}

#Preview {
    TabBarView()
}
