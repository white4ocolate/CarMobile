//
//  QuickAccessCardView.swift
//  CarMobile
//
//  Created by white4ocolate on 09.01.2025.
//

import Foundation
import SwiftUI

struct QuickAccessCardView: View {

    //MARK: - View
    var body: some View {
        VStack(spacing: 20) {
            SoftwareUpdateButton
            Divider().background(LinearGradient(colors: [.clear, .white, .clear], startPoint: .leading, endPoint: .trailing))
                .frame(maxWidth: 300)
                .opacity(0.3)
            PhoneKeyButton
        }
        .applyModifier(type: .homeCard)
    }
}

extension QuickAccessCardView {
    //SoftwareUpdateButton
    private var SoftwareUpdateButton: some View {
        Button {
            print("Software Update")
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 22))
                    .foregroundStyle(.gray)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Software Update")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("Connect to WIFI to download")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }

    //PhoneKeyButton
    private var PhoneKeyButton: some View {
        Button {
            print("Phone Key")
        } label: {
            HStack {
                Image(systemName: "iphone")
                    .font(.system(size: 22))
                    .foregroundStyle(.gray)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Phone Key")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("Enable passive entry and remote controls")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    QuickAccessCardView()
}
