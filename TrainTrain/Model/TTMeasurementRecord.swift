//
//  TTMeasurementRecord.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/12/23.
//

import Foundation
import SwiftData

@Model
final class TTMeasurementRecord {
    var neck: Double? = nil
    var chest: Double? = nil
    var rightArm: Double? = nil
    var leftArm: Double? = nil
    var waist: Double? = nil
    var hips: Double? = nil
    var rightThigh: Double? = nil
    var leftThigh: Double? = nil
    var weight: Double? = nil
    var bodyFat: Double? = nil
    var leanTissue: Double? = nil

    var measured: Date = Date.now

    init(neck: Double? = nil, chest: Double? = nil, rightArm: Double? = nil, leftArm: Double? = nil, waist: Double? = nil, hips: Double? = nil, rightThigh: Double? = nil, leftThigh: Double? = nil, weight: Double? = nil, bodyFat: Double? = nil, leanTissue: Double? = nil, measured: Date) {
        self.neck = neck
        self.chest = chest
        self.rightArm = rightArm
        self.leftArm = leftArm
        self.waist = waist
        self.hips = hips
        self.rightThigh = rightThigh
        self.leftThigh = leftThigh
        self.weight = weight
        self.bodyFat = bodyFat
        self.leanTissue = leanTissue
        self.measured = measured
    }
}

enum BodyMeasure {
    case neck, chest, rightArm, leftArm, waist, hips, rightThigh, leftThigh, weight, bodyFat, leanTissue
}
