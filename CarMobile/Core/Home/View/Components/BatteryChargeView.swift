//
//  BatteryChargeView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

struct BatteryChargeCardView: View {

    //MARK: - Properties
    @State var batteryCharge: Double = 0.73
    @State var chargePercentage: Double = 0.0
    @State var fillCharge: CGFloat = 0.0

    //MARK: - View
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 1)
                .frame(width: 100, height: 100)
                .foregroundStyle(.purple.opacity(0.2))
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 100, height: 100)
                .foregroundStyle(.clear)
            Circle()
                .trim(from: 0, to: fillCharge)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 110, height: 110)
                .foregroundStyle(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing))
                .rotationEffect(.degrees(-90))
            HStack {
                VStack {
                    Text("Battery")
                        .foregroundStyle(.gray)
                        .fontWeight(.regular)
                        .font(.system(size: 13))
                    Text((chargePercentage).asPercentString())
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                }
            }
        }
        .offset(x: 100, y: -77)
        .onAppear {
            Task {
                withAnimation(.easeInOut(duration: batteryCharge * 3 )) {
                    fillCharge = batteryCharge
                }
                await updateChargePercentages()
            }
        }
    }

    private func updateChargePercentages() async {
        while chargePercentage < batteryCharge * 100{
            if chargePercentage < batteryCharge * 100 {
                chargePercentage += 1
            }
            try? await Task.sleep(nanoseconds: 30_000_000)
        }
    }
}

#Preview {
    BatteryChargeCardView(batteryCharge: 0.42, chargePercentage: 0.0, fillCharge: 0.0)
}
