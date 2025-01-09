//
//  CarView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

extension HomeView {
    var Car: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .frame(maxWidth: light * 5)
                .frame(height: light * 0.8)
                .blur(radius: light * 2)
            Image("audi_e-tron")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .offset(y: 30)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2)) {
                light = 50
            }
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if light <  100 {
                    lightPercentage += 1
                } else {
                    timer.invalidate()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}
