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
        VStack(spacing: 0) {
            HStack {
                Text("Nearest Station")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                Spacer()
                Button {
                    print("Show all places")
                } label: {
                    Text("View all")
                        .foregroundStyle(.secondaryText)
                        .fontWeight(.regular)
                }
                .frame(width: 80, height: 30, alignment: .trailing)
            }
            .padding(.horizontal)
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
