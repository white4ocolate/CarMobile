//
//  HomeView.swift
//  CarMobile
//
//  Created by white4ocolate on 14.12.2024.
//

import SwiftUI

struct HomeView: View {

    //MARK: - Properties
    @State var selectedTab: Tabs = .home

    //MARK: - View
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10) {
                    ZStack {
                        CarView()
                        BatteryChargeCardView()
                    }
                    QuickAccessCardView()
                    BatteryInfoCardView()
                    MapCardView()
                    Spacer()
                }
                .padding(.vertical, 80)
            }
            .overlay {
                NavBarView()
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
