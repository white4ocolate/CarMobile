//
//  ContentView.swift
//  CarMobile
//
//  Created by white4ocolate on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        ZStack {
            coordinator.view(for: coordinator.currentTab)
            VStack {
                Spacer()
                TabBarView(selectedTab: $coordinator.currentTab)
            }
        }
    }
}

#Preview {
    ContentView()
}
