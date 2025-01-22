//
//  AirControlView.swift
//  CarMobile
//
//  Created by white4ocolate on 14.01.2025.
//

import SwiftUI

struct AirControlView: View {

    @State private var isVisible = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Image("Audi_Q5_Sportback_top")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height * 0.75)
                    .offset(y: isVisible ? 0 : +1000)
                    .animation(.easeOut(duration: 1), value: isVisible)
                    .onAppear{
                        withAnimation {
                            isVisible = true
                        }
                    }
                Spacer()
            }
        }
    }
}

#Preview {
    AirControlView()
}
