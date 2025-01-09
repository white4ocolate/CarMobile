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
                    .font(.system(size: 22))
                    .foregroundStyle(isActive ? .white : .gray)
            if isActive {
                //border
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(height: 40)
                    .foregroundStyle(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .topTrailing, endPoint: .bottomLeading))
                //shadow
                Circle()
                    .stroke(lineWidth: 4)
                    .frame(height: 50)
                    .blur(radius: 5)
                    .foregroundStyle(.white.opacity(0.3))
            }
        }
    }
}

#Preview {
    TabBarButton(imageName: "home.fill", isActive: true)
}
