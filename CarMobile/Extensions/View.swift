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

    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        return self
            .background(Blur(radius: radius, opaque: opaque))
    }

    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {

        return self
            .overlay {
                shape
                    .stroke(color, lineWidth: lineWidth)
                    .blendMode(blendMode)
                    .offset(x: offsetX, y: offsetY)
                    .blur(radius: blur)
                    .mask(shape)
                    .opacity(opacity)
            }
    }
}
