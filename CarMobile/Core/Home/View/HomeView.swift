//
//  HomeView.swift
//  CarMobile
//
//  Created by white4ocolate on 14.12.2024.
//

import SwiftUI

struct HomeView: View {

    //MARK: - Properties
    @State var batteryHealth: Double = 0.88
    @State var batteryCharge: Double = 0.73
    @State var chargePercentage: Double = 0.0
    @State var healthPercentage: Double = 0.0
    @State var lightPercentage: Double = 0.0
    @State var fillCharge: CGFloat = 0.0
    @State var fillHealth: CGFloat = 0.0
    @State var light: CGFloat = 0.0
    @State var selectedTab: Tabs = .home

    //MARK: - View
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ZStack {
                        Car
                        BatteryCharge
                    }
                    QuickAccessCard
                    BatteryInfoCard
                    MapCard
                    Spacer()
                }
                .padding(.vertical, 80)
            }
            .overlay {
                NavBar
            }
            VStack {
                Spacer()
                TabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    HomeView()
}
