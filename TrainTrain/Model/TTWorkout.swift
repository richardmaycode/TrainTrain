//
//  TTWorkout.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/8/23.
//

import Foundation
import SwiftData

@Model
final class TTWorkout {
    var name: String = ""
    var summary: String = ""

    @Relationship(.cascade) var segments: [TTWorkoutSegment]? = []

    init(name: String, summary: String) {
        self.name = name
        self.summary = summary
        self.segments = WorkoutSegmentType.allCases.map { TTWorkoutSegment(name: $0.rawValue.capitalized, blocks: []) }
    }
}

@Model
final class TTWorkoutSegment {
    var name: String = ""
    var isActive: Bool = false

    @Relationship(.cascade) var blocks: [TTBlock]? = []

    init(name: String, blocks: [TTBlock]) {
        self.name = name
        self.blocks = blocks
    }
}

enum WorkoutSegmentType: String, CaseIterable {
    case warmup, main, cardio, cooldown
}
