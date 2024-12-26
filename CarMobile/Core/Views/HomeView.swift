//
//  HomeView.swift
//  CarMobile
//
//  Created by white4ocolate on 14.12.2024.
//

import SwiftUI

struct HomeView: View {

    //MARK: - Properties
    @State var batteryHealth: Double = 0.88
    @State var batteryCharge: Double = 0.73
    @State var chargePercentage: Double = 0.0
    @State var healthPercentage: Double = 0.0
    @State var fillCharge: CGFloat = 0.0
    @State var fillHealth: CGFloat = 0.0
    @State var light: CGFloat = 0.0
    @State var selectedTab: Tabs = .home

    //MARK: - View
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack {
                    TitleAndControls
                    ZStack {
                        Car
                        BatteryCharge
                    }
                    QuickAccessPanel
                    BatteryInfo
                    QuickAccessPanel
                    BatteryInfo
                    Spacer()
                }
            }
            VStack {
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

extension HomeView {
    //TitleAndControls
    private var TitleAndControls: some View {
        HStack {
            Image("avatar")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text("Hello, User")
                    .foregroundStyle(.white)
                Text("Cyber Truck")
                    .foregroundStyle(.gray)
            }
            .font(.headline)
            Spacer()
            Image(systemName: "bell.badge.fill")
                .foregroundStyle(.gray)
                .font(.system(size: 22))
        }
        .padding()
    }

    //Car
    private var Car: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .frame(maxWidth: light * 3)
                .frame(height: light)
                .blur(radius: light)
            Image("CyberTruck")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2)) {
                light = 100
            }
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if light <  100 {
                    healthPercentage += 1
                } else {
                    timer.invalidate()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }

    //BatteryCharge
    private var BatteryCharge: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 1)
                .frame(width: 80, height: 80)
                .foregroundStyle(.purple.opacity(0.2))
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 80, height: 80)
                .foregroundStyle(.clear)
            Circle()
                .trim(from: 0, to: fillCharge)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 100)
                .foregroundStyle(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing))
                .rotationEffect(.degrees(-90))
            HStack {
                VStack {
                    Text("Battery")
                        .foregroundStyle(.gray)
                        .font(.caption)
                    Text((chargePercentage).asPercentString())
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                }
            }
        }
        .offset(x: 75, y: -120)
        .onAppear {
            withAnimation(.easeInOut(duration: 3)) {
                fillCharge = batteryCharge
            }
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if chargePercentage < batteryCharge * 100 {
                    chargePercentage += 1
                } else {
                    timer.invalidate()
                }
            }
        }
    }

    //QuickAccessPanel
    private var QuickAccessPanel: some View {
        VStack(spacing: 20) {
            SoftwareUpdateButton
            Divider().background(LinearGradient(colors: [.clear, .white, .clear], startPoint: .leading, endPoint: .trailing))
                .frame(maxWidth: 300)
                .opacity(0.3)
            PhoneKeyButton
        }
        .applyHomeCardStyle()
    }

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

    //BatteryInfo
    private var BatteryInfo: some View {
        VStack {
            BatteryHealth
            BatteryLevel
        }
        .applyHomeCardStyle()
        .onAppear {
            withAnimation(.easeInOut(duration: 3)) {
                fillHealth = batteryHealth
            }
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if healthPercentage < batteryHealth * 100 {
                    healthPercentage += 1
                } else {
                    timer.invalidate()
                }
            }
        }
    }

    //BatteryHealth
    private var BatteryHealth: some View {
        Button {
            print("Battery Health")
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Battery Health")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("Charge Cycle: 350")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundStyle(.gray)
                    .padding()
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }

    //BatteryLevel
    private var BatteryLevel: some View {
        VStack {
            HStack {
                Image(systemName: "bolt.fill")
                    .font(.system(size: 22))
                    .foregroundStyle(.mintGreen)
                    .padding()
                Spacer()
                Text((healthPercentage).asPercentString())
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding(.trailing)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.progressTheme)
                        .frame(height: 10)
                    LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing)
                        .mask(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: geometry.size.width * fillHealth, height: 10)
                        }
                }
            }
            .padding(.horizontal)
            .offset(y: -16)
        }
    }
}

#Preview {
    HomeView()
}
