//
//  Coordinator.swift
//  CarMobile
//
//  Created by white4ocolate on 10.01.2025.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {

    @Published var currentTab: Tabs = .home

    @ViewBuilder
    func view(for tab: Tabs) -> some View {
        switch tab {
        case .home:
            HomeView()
        case .car:
            CarControlView()
        case .lock:
            HomeView()
        case .bolt:
            HomeView()
        }
    }
}
