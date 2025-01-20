//
//  CarView.swift
//  CarMobile
//
//  Created by white4ocolate on 10.01.2025.
//

import SwiftUI

struct CarControlView: View {

    @State private var numbersBacklightLength: CGFloat = 0.0
    @State private var numbersLight: CGFloat = 0.3
    @State private var backLight: CGFloat = 0.3
    @State private var themebackLight: CGFloat = 0.3
    @State private var circumferenceLength: CGFloat = 0.75
    @StateObject private var coordinator = Coordinator()
    @State private var isStart: Bool = false
    @State private var isVisible = false
    @State private var speedlineOpacity: CGFloat = 0.0

    let hiddenIndices = 55...72

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ZStack {
                    VStack {
                        Speedometer
                        Spacer()
                        StartButton
                    }
                    .padding(.bottom, 80)
                    HStack {

                        LeftControlBar()
                            .offset(x: isVisible ? 0 : -200)
                            .animation(.easeOut(duration: 1.5), value: isVisible)
                        RightControlBar()
                            .offset(x: isVisible ? 0 : +200)
                            .animation(.easeOut(duration: 1.5), value: isVisible)
                    }
                    .padding(.top, 150)
                }
            }
        }
    }
}

extension CarControlView {

    //MARK: - Speedometer
    private var Speedometer: some View {
        ZStack {
            //rim
            Circle()
                .stroke(lineWidth: 1)
                .frame(width: 300, height: 300)
                .opacity(0.1)

            //theme
            Circle()
                .trim(from: 0, to: circumferenceLength)
                .rotation(Angle(degrees: 135))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.progressTheme)
                .frame(width: 250, height: 250)
                .opacity(themebackLight)

            //speedline
            Circle()
                .trim(from: 0, to: 0.75)
                .rotation(Angle(degrees: 135))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .foregroundStyle(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing))
                .frame(width: 250, height: 250)
                .opacity(0)

            //background speedline
            Circle()
                .trim(from: 0, to: 0.75)
                .rotation(Angle(degrees: 135))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing))
                .frame(width: 250, height: 250)
                .blur(radius: 30)
                .opacity(0)

            VStack(spacing: 30) {
                VStack {
                    Text("0")
                        .font(.system(size: 55))
                        .fontWeight(.heavy)
                    Text("mph")
                }
                HStack {
                    Image(systemName: "ev.charger.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("200 mi")
                }
            }
            .frame(width:150, height: 210, alignment: .bottom)
            .opacity(backLight)

            Circle()
                .trim(from: 0, to: 0.2)
                .rotation(Angle(degrees: 54))
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .foregroundStyle(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing))
                .frame(width: 250, height: 250)
                .opacity(backLight)

            //backlight on numbers
            Circle()
                .trim(from: 0, to: numbersBacklightLength)
                .rotation(Angle(degrees: 135))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(LinearGradient(colors: [.progressTheme], startPoint: .leading, endPoint: .trailing))
                .frame(width: 250, height: 250)
                .blur(radius: 35)

            //markers
            ZStack {
                ForEach(0..<8) { index in
                    if index != 7 {
                        //white dots
                        Circle()
                            .fill(Color.white)
                            .frame(width: 5, height: 5)
                            .offset(x: 250 / 2)
                            .rotationEffect(.degrees(Double(index) * (360 / Double(8))))
                            .opacity(backLight)

                        //numbers
                        Text("\(index * 20)")
                            .rotationEffect(.degrees(Double(225 - (index * 45))))
                            .font(.caption)
                            .foregroundColor(.white)
                            .offset(x: (240 / 2) - 20)
                            .rotationEffect(.degrees(Double(index) * (360 / Double(8))))
                            .opacity(numbersLight)
                    }
                }
            }
            .rotationEffect(.degrees(135))

            //dashes
            ZStack {
                ForEach(0..<72) { index in
                    if !hiddenIndices.contains(index) {
                        Rectangle()
                            .frame(width: 10, height: 2)
                            .foregroundStyle(.blue)
                            .offset(x: 140 / 2)
                            .rotationEffect(.degrees(Double(index) * (360 / Double(72))))
                            .opacity(backLight)
                    }
                }
            }
            .rotationEffect(.degrees(135))

            //line under dashes
            Circle()
                .trim(from: 0, to: circumferenceLength)
                .rotation(Angle(degrees: 135))
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.progressEnd)
                .frame(width: 120, height: 120)
                .opacity(backLight)

        }
        .offset(y: isVisible ? 0 : +200)
        .opacity(isVisible ? 1 : 0)
        .animation(.easeOut(duration: 1), value: isVisible)
        .onAppear {
            withAnimation {
                isVisible = true
            }
        }
    }

    //MARK: - StartButton
    private var StartButton: some View {
        ZStack {
            //button connector
            Circle()
                .stroke(LinearGradient(colors: [.black, .white], startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(width: 80)
                .opacity(0.5)
            Circle()
                .fill(LinearGradient(colors: [.black, .white], startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(width: 79)
                .opacity(0.2)

            //light from button
            Circle()
                .stroke(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing), lineWidth: 5)
                .frame(width: 90)
                .blur(radius: 20)
                .opacity(isStart ? 1 : 0)
            Button {
                isStart.toggle()
                Task {
                    withAnimation(.easeInOut(duration: 2 )) {
                        backLight = isStart ? 1 : 0.3
                        numbersBacklightLength = isStart ? 0.75 : 0.0
                        numbersLight = isStart ? 1 : 0.3
                        themebackLight = isStart ? 0.9 : 0.3
                        speedlineOpacity = isStart ? 1 : 0.0
                        HapticManager.startHapticFeedback()
                    }
                }
            } label: {
                ZStack{
                    //button background
                    Circle()
                        .fill(LinearGradient(colors: [.progressStart, .progressEnd], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 59)
                        .opacity(isStart ? 1 : 0.5)
                    //button
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .frame(width: 20)
                        .rotationEffect(.degrees(-55))
                        .foregroundStyle(isStart ? .white : .black)
                        .opacity(isStart ? 1 : 0.4)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 3, height: 10)
                        .offset(y: -7)
                        .foregroundStyle(isStart ? .white : .black)
                        .opacity(isStart ? 1 : 0.4)
                }
            }
            .onAppear {
                HapticManager.prepareHaptics()
            }
        }
    }
}

#Preview {
    CarControlView()
}
