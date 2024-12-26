//
//  DeveloperPreview.swift
//  CarMobile
//
//  Created by white4ocolate on 25.12.2024.
//

import Foundation
import SwiftUI

class DeveloperPreview {
    static let instance = DeveloperPreview()

    init() {}

    let car = Car(id: "CyberTruck", symbol: "CbrTrck", name: "Cyber Truck", image: "CyberTruck", chargePercentage: 0.54, healthPercentage: 0.88)
}
