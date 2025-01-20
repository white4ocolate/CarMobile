//
//  MapCardView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

struct MapCardView: View {

    //MARK: - View
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Nearest Station")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .frame(height: 30)
                Spacer()
                Button {
                    print("Show all places")
                } label: {
                    Text("View all")
                        .foregroundStyle(.gray)
                        .fontWeight(.regular)
                        .frame(width: 100, height: 30, alignment: .trailing)
                        .contentShape(Rectangle())
                }
            }
            .padding(.horizontal, 20)
            Image("map")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                        .opacity(0.5))
                .padding(.horizontal)
                .padding(.vertical, 5)
        }
    }
}

#Preview {
    MapCardView()
}
