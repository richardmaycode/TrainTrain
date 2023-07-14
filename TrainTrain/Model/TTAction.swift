//
//  TTAction.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/10/23.
//

import Foundation
import SwiftData

@Model
final class TTAction {
    var excerciseID: UUID
    var isSuper: Bool = false
    var isCustom: Bool = false

    @Relationship(.cascade) var sets: [TTSet] = []

    init(excerciseID: UUID, isSuper: Bool = false, isCustom: Bool = false,sets: [TTSet] = []) {
        self.excerciseID = excerciseID
        self.isSuper = isSuper
        self.isCustom = isCustom
        self.sets = sets
    }
}

extension TTAction: Equatable {
    static func == (lhs: TTAction, rhs: TTAction) -> Bool {
        lhs.excerciseID == rhs.excerciseID
    }
}

extension TTAction: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(excerciseID)
    }
}
