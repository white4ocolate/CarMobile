//
//  TabBarView.swift
//  CarMobile
//
//  Created by white4ocolate on 26.12.2024.
//

import SwiftUI

struct TabBarView: View {

    //MARK: - View
    var body: some View {
        HStack(spacing: 40) {
            NavigationLink {
                CarControlView()
            } label: {
                Image(systemName: "car.fill")
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
            }
            .padding(.horizontal, 30)

            NavigationLink {
                CarControlView()
            } label: {
                Image(systemName: "lock.fill")
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
            }
            .padding(.horizontal, 30)

            NavigationLink {
                CarControlView()
            } label: {
                Image(systemName: "bolt.fill")
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
            }
            .padding(.horizontal, 30)

        }

        .font(.title)
        .frame(height: 55)
        .padding(EdgeInsets(top: 0, leading: 32, bottom: 24, trailing: 32 ))
        .backgroundBlur(radius: 20, opaque: true)
        .background(
            Rectangle()
                .stroke(.gray.opacity(0.25))
        )
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()

    }
}

#Preview {
    //    TabBarView(selectedTab: .constant(.home))
    HomeView()
}
