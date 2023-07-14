//
//  TTBlock.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/10/23.
//

import Foundation
import SwiftData

@Model
final class TTBlock {
    var blockType: String = ""
    var numberOfRepeats: Int = 1
    var targetHeartRateZone: String = ""

    @Relationship(.cascade) var actions: [TTAction] = []

    init(blockType: String = "", numberOfRepeats: Int = 1, targetHeartRateZone: String = "", actions: [TTAction] = []) {
        self.blockType = blockType
        self.numberOfRepeats = numberOfRepeats
        self.targetHeartRateZone = targetHeartRateZone
        self.actions = actions
    }

    var actionLimit: Int {
        return 1
    }

    func limitCheck(_ newValue: Int) -> Bool {
        newValue > actionLimit ? true : false
    }
}

enum BlockType: Int, Codable, CaseIterable, Identifiable {
    case single, choice, superSet, triSet, circuit

    var id: Int { self.rawValue }

    var name: String {
        switch self {
        case .single:   "Single"
        case .choice:   "Choice"
        case .superSet: "Super Set"
        case .triSet:   "Tri-Set"
        case .circuit:  "Circuit"
        }
    }

    var actionLimit: Int {
        switch self {
        case .single:       1
        case .choice:       2
        case .superSet:     2
        case .triSet:       3
        case .circuit:      10
        }
    }
}

enum HRZone: Int {
    case one, two, three, four, five
}
