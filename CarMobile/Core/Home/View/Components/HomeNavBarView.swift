//
//  HomeNavBarView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

struct NavBarView: View {
    //MARK: - View
    var body: some View {
            TitleAndNotifications
            .frame(height: 55, alignment: .top)
            .padding(.horizontal)
            .padding(.top, 49)
            .backgroundBlur(radius: 20, opaque: true)
            .frame(maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
    }
}

extension NavBarView {
    private var TitleAndNotifications: some View {
        HStack {
            CircleProfileImageView()
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text("Hello, Yurii")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text("Audi e-tron 2024")
                    .foregroundStyle(.secondary)
                    .fontWeight(.regular)
            }
            .font(.system(size: 16))

            Spacer()
            Image(systemName: "bell.badge.fill")
                .foregroundStyle(.secondary)
                .font(.system(size: 25))
        }
        .padding(.vertical, 7)
        .padding(.horizontal)
    }
}

#Preview {
    NavBarView()
}
