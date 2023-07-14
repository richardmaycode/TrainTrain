//
//  ExerciseSelectionView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/11/23.
//

import SwiftUI

struct ExerciseSelectionView: View {

    @Environment(\.dismiss) var dismiss
    @Binding var exerciseID: UUID?

    let onAdd: (UUID) -> Void?


    var body: some View {
        Button {
            onAdd(UUID())
            dismiss()
        } label: {
            Text("Select Workout")
        }
    }
}

//#Preview {
//    ExerciseSelectionView()
//}
