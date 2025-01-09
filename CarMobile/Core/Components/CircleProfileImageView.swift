//
//  CircleProfileImageView.swift
//  CarMobile
//
//  Created by white4ocolate on 07.01.2025.
//

import SwiftUI

struct CircleProfileImageView: View {
    var body: some View {
        Image("avatarPhoto")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircleProfileImageView()
}
