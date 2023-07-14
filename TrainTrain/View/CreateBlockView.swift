//
//  CreateBlockView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/11/23.
//

import SwiftUI

struct CreateBlockView: View {

    var segment: TTWorkoutSegment
    @State var blockType: BlockType = .single
    @State var exceriseID: UUID? = nil

    @State var selectedExercises: [UUID] = []

    var body: some View {
        Form {
            Picker("Type", selection: $blockType) {
                ForEach(BlockType.allCases) { blocktype in
                    Text(blocktype.name)
                        .tag(blocktype)
                }
            }

            NavigationLink {
                ExerciseSelectionView(exerciseID: $exceriseID, onAdd: { id in
                    selectedExercises.append(id)
            })
            } label: {
                Label("Search Exercises", systemImage: "magnifyingglass")

            }
            let _ = print(selectedExercises)
            List(selectedExercises, id: \.self) { excerise in
                Text(excerise.uuidString)
            }

        }
        .navigationTitle("Adding Action")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                VStack {
                    Text(segment.name)
                }
            }
        }
    }
}

//#Preview {
//    CreateBlockView()
//}
