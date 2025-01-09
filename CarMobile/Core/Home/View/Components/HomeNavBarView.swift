//
//  HomeNavBarView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

extension HomeView {
    //NavBar
    var NavBar: some View {
        ZStack {
            TitleAndNotifications
                .padding(.horizontal)
                .frame(height: 90, alignment: .bottom)

                .background(
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 20, opaque: true)
                )
                .ignoresSafeArea()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }

    //TitleAndNotifications
    private var TitleAndNotifications: some View {
        HStack {
            CircleProfileImageView()
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text("Hello, Yurii")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text("Audi e-tron 2024")
                    .foregroundStyle(.lightGray)
                    .fontWeight(.regular)
            }
            .font(.system(size: 16))
            Spacer()
            Image(systemName: "bell.badge.fill")
                .foregroundStyle(.lightGray)
                .font(.system(size: 25))
        }
        .padding(.horizontal)
    }
}
