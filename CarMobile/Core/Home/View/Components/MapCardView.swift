//
//  MapCardView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

extension HomeView {
    //MapCard
    var MapCard: some View {
        Image("map")
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
                    .opacity(0.5))
            .padding(.horizontal)
            .padding(.vertical, 5)
    }
}
