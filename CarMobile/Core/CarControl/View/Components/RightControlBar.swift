//
//  RightControlBar.swift
//  CarMobile
//
//  Created by white4ocolate on 14.01.2025.
//

import SwiftUI

struct RightControlBar : View {
    var body: some View {
        ZStack(alignment: .trailing) {
            RightTrapezoid()
                .fill(LinearGradient(colors: [.darkBlue.opacity(0.2) , .gray.opacity(0.6)], startPoint: .trailing, endPoint: .leading))
                .frame(height: 400)
                .overlay {
                    RightTrapezoid(isBackground: true)
                        .stroke(lineWidth: 0.75)
                        .foregroundStyle(LinearGradient(colors: [.clear, .gray, .clear], startPoint: .top, endPoint: .bottom))
                        .opacity(0.75)
                }
            VStack(spacing: 60) {
                Image(systemName: "gauge.open.with.lines.needle.33percent")
                    .font(.system(size: 25))
                Image(systemName: "windshield.front.and.wiper")
                    .font(.system(size: 25))
                Image(systemName: "carseat.left.and.heat.waves.fill")
                    .font(.system(size: 25))
                Image(systemName: "car.top.door.rear.left.and.rear.right.open.fill")
                    .font(.system(size: 25))
            }
            .foregroundStyle(.gray)
            .padding(8)
        }
    }
}

struct RightTrapezoid: Shape {
    var isBackground: Bool = false

    func path(in rect: CGRect) -> Path {
        var path = Path()

        if !isBackground {
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        } else {
            path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        path.addLine(to: CGPoint(x: rect.maxX - 40, y: rect.maxY - 40))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 50, y: rect.maxY - 60), control: CGPoint(x: rect.maxX - 50, y: rect.maxY - 50))
        path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.minY + 60))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 40, y: rect.minY + 40), control: CGPoint(x: rect.maxX - 50, y: rect.minY + 50))
        if !isBackground {
            path.closeSubpath()
        } else {
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }

        return path
    }
}

#Preview {
    RightControlBar()
}
