//
//  TTSet.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/14/23.
//

import Foundation
import SwiftData

@Model
final class TTSet {
    var amount: Int = 0
    var weight: Double = 0.0
    var speed: Double = 0.0
    var untilFailure: Bool = false

    init(amount: Int = 0, weight: Double = 0.0, speed: Double = 0.0, untilFailure: Bool = false) {
        self.amount = amount
        self.weight = weight
        self.speed = speed
        self.untilFailure = untilFailure
    }
}

