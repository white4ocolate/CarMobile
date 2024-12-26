//
//  TabBarButton.swift
//  CarMobile
//
//  Created by white4ocolate on 26.12.2024.
//

import SwiftUI

struct TabBarButton: View {

    //MARK: - Properties
    var imageName: String
    var isActive: Bool

    //MARK: - View
    var body: some View {
        ZStack {
                Image(systemName: imageName)
                    .font(.system(size: 25))
                    .foregroundStyle(isActive ? .white : .gray)
            if isActive {
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 50, height: 45)
                    .foregroundStyle(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .topTrailing, endPoint: .bottomLeading))
                Circle()
                    .stroke(lineWidth: 4)
                    .frame(width: 50, height: 50)
                    .blur(radius: 5)
                    .foregroundStyle(.white.opacity(0.3))
            }
        }
    }
}

#Preview {
    TabBarButton(imageName: "home.fill", isActive: true)
}
