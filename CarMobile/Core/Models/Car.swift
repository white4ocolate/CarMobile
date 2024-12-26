//
//  Car.swift
//  CarMobile
//
//  Created by white4ocolate on 25.12.2024.
//

import Foundation

struct Car: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let chargePercentage: Double
    let healthPercentage: Double
}
