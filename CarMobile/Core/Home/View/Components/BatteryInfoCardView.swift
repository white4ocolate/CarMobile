//
//  BatteryInfoCardView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

extension HomeView {
    //BatteryInfo
    var BatteryInfoCard: some View {
        VStack {
            BatteryHealth
            BatteryLevel
        }
        .applyModifier(type: .homeCard)
        .onAppear {
            withAnimation(.easeInOut(duration: batteryHealth * 3)) {
                fillHealth = batteryHealth
            }
        }
    }

    //BatteryHealth
    private var BatteryHealth: some View {
        Button {
            print("Battery Health")
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Battery Health")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("Charge Cycle: 350")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundStyle(.gray)
                    .padding()
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }

    //BatteryLevel
    private var BatteryLevel: some View {
        VStack {
            HStack {
                Image(systemName: "bolt.fill")
                    .font(.system(size: 22))
                    .foregroundStyle(.mintGreen)
                    .padding()
                Spacer()
                Text((healthPercentage).asPercentString())
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding(.trailing)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.progressTheme)
                        .frame(height: 10)
                    LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing)
                        .mask(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: geometry.size.width * fillHealth, height: 10)
                        }
                }
            }
            .padding(.horizontal)
            .offset(y: -16)
        }
    }
}
