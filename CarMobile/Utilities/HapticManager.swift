//
//  HapticManager.swift
//  CarMobile
//
//  Created by white4ocolate on 13.01.2025.
//

import Foundation
import CoreHaptics

class HapticManager {

    //MARK: - Properties
    private static var engine: CHHapticEngine?

    //Init HapticEngine
    static func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error init haptic engine: \(error.localizedDescription)")
        }
    }

    //Creating vibration
    static func startHapticFeedback() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        var events = [CHHapticEvent]()

        //Increase from minimum to maximum vibration
        for i in stride(from: 0.0, to: 1.0, by: 0.1) {
            events.append(CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [
                    CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i)),
                    CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
                ],
                relativeTime: Double(i) * 0.5,
                duration: 0.05
            ))
        }

        //Vibration
        events.append(CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
            ],
            relativeTime: 0.5,
            duration: 0.75
        ))

        //Decrease from maximum to minimum intensity
        for i in stride(from: 1.0, to: 0.0, by: -0.2) {
            events.append(CHHapticEvent(
                eventType: .hapticContinuous,
                parameters: [
                    CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i)),
                    CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
                ],
                relativeTime: 1.25 + Double(1.0 - Double(i)) * 0.5,
                duration: 0.05
            ))
        }

        //Creating pattern and start
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Error when creating pattern: \(error.localizedDescription)")
        }
    }
}
