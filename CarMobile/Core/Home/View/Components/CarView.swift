//
//  CarView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

struct CarView: View {

    //MARK: - Properties
    @State var lightPercentage: Double = 0.0
    @State var light: CGFloat = 0.0

    var body: some View {
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
            Task {
                withAnimation(.easeInOut(duration: 2)) {
                    light = 50
                }
                await updateLightPercentage()
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }

    private func updateLightPercentage() async {
        while light < 100 {
            if lightPercentage < 100 {
                lightPercentage += 1
            }
            try? await Task.sleep(nanoseconds: 30_000_000)
        }
    }
}

#Preview {
    CarView()
}
