//
//  CustomTabBarView.swift
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

struct CustomTabBarView: View {

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
//            HomeView()
            HStack {
                ForEach(tabItems, id: \.tab) { item in
                    Button {
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
            .frame(width: 350, height: 40)
            .padding()
            .background(
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 10, opaque: true)
//                    .background(.clear.opacity(0.15))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 100)
                    )
            )
            .applyTabBardStyle()
        }
    }
}

#Preview {
    CustomTabBarView(selectedTab: .constant(.home))
}
