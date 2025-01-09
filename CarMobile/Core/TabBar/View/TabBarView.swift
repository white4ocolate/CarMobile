//
//  TabBarView.swift
//  CarMobile
//
//  Created by white4ocolate on 26.12.2024.
//

import SwiftUI

enum Tabs: Int {
    case home
    case car
    case lock
    case bolt
}

struct TabBarView: View {

    //MARK: - Properties
    @Binding var selectedTab: Tabs
    let tabItems: [(icon: String, tab: Tabs)] = [
           ("house.fill", .home),
           ("car.fill", .car),
           ("lock.fill", .lock),
           ("bolt.fill", .bolt)
       ]

    //MARK: - View
    var body: some View {
        ZStack {
            HStack {
                ForEach(tabItems, id: \.tab) { item in
                    Button {
                        let generator = UIImpactFeedbackGenerator(style: .soft)
                        generator.impactOccurred()
                        selectedTab = item.tab
                        print("pressed \(item.tab)")
                    } label: {
                        TabBarButton(imageName: item.icon,
                                     isActive: selectedTab == item.tab)
                        .frame(width: 80, height: 80)
                    }
                    .contentShape(Rectangle())
                }
            }
            .frame(width: 350, height: 30)
            .padding()
            .background(
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 10, opaque: true)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 100)
                    )
            )
            .applyModifier(type: .tabBar)
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
