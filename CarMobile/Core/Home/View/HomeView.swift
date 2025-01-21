//
//  HomeView.swift
//  CarMobile
//
//  Created by white4ocolate on 14.12.2024.
//

import SwiftUI

struct HomeView: View {

    //MARK: - View
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 10) {
                        ZStack {
                            CarInfoView()
                            BatteryChargeView()
                        }
                        QuickAccessCardView()
                        BatteryInfoCardView()
                        MapCardView()
                        Spacer()
                    }
                }
                .scrollIndicators(.hidden)
                .safeAreaInset(edge: .top) {
                    EmptyView()
                        .frame(height: 80)
                }
                .safeAreaInset(edge: .bottom) {
                    EmptyView()
                        .frame(height: 50)
                }
            }
            .overlay {
                NavBarView()
            }
            .overlay {
                TabBarView()
            }

        }
    }
}

#Preview {
    HomeView()
}
