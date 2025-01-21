//
//  LeftControlBar.swift
//  CarMobile
//
//  Created by white4ocolate on 14.01.2025.
//

import SwiftUI

struct LeftControlBar : View {
    var body: some View {
        ZStack(alignment: .leading) {
            LeftTrapezoid()
                .fill(LinearGradient(colors: [.darkBlue.opacity(0.2), .gray.opacity(0.6)], startPoint: .leading, endPoint: .trailing))
                .frame(height: 400)
                .overlay {
                    LeftTrapezoid(isBackground: true)
                        .stroke(lineWidth: 0.75)
                        .foregroundStyle(LinearGradient(colors: [.clear, .gray, .clear], startPoint: .top, endPoint: .bottom))
                        .opacity(0.75)

                }
            VStack(spacing: 60) {
                Image(systemName: "car.fill")
                    .font(.system(size: 25))
                NavigationLink {
                    AirControlView()
                } label: {
                    Image(systemName: "fan.fill")
                        .font(.system(size: 25))
                }
                Image(systemName: "parkingsign")
                    .font(.system(size: 25))
                Image(systemName: "steeringwheel")
                    .font(.system(size: 25))
            }
            .foregroundStyle(.gray)
            .padding(8)
        }

    }
}

struct LeftTrapezoid: Shape {
    var isBackground: Bool = false

    func path(in rect: CGRect) -> Path {
        var path = Path()

        if !isBackground {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        } else {
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        path.addLine(to: CGPoint(x: rect.minX + 40, y: rect.maxY - 40))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 50, y: rect.maxY - 60), control: CGPoint(x: rect.minX + 50, y: rect.maxY - 50))
        path.addLine(to: CGPoint(x: rect.minX + 50, y: rect.minY + 60))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 40, y: rect.minY + 40), control: CGPoint(x: rect.minX + 50, y: rect.minY + 50))
        if !isBackground {
            path.closeSubpath()
        } else {
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }

        return path
    }

}

#Preview {
    LeftControlBar()
}
