//
//  WorkoutDetailView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/8/23.
//

import SwiftUI

struct WorkoutDetailView: View {

    var workout: TTWorkout
    @State var isEditing: Bool = false

    var body: some View {
        List(workout.segments ?? []) { segment in
            if segment.isActive {
                Section {
                    GroupBox {
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        print("Add Activity Block to Section: \(segment.name)")
                    } label: {
                        Label("Add Activity", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                            .frame(maxWidth: .infinity)
                            .symbolVariant(.circle.fill)
                            .padding(.vertical, 8)
                        
                    }
                    
                    .buttonStyle(.borderedProminent)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                } header: {
                    Text(segment.name)
                }
            } else {
                Section {
                    Button {
                        print("Activate Section: \(segment.name)")
                        segment.isActive = true
                    } label: {
                        Label("Add \(segment.name)", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                            .frame(maxWidth: .infinity)
                            .symbolVariant(.circle.fill)
                            .padding(.vertical, 8)

                    }

                    .buttonStyle(.borderedProminent)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(workout.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                isEditing.toggle()
            } label: {
                Label {
                    Text(isEditing ? "Save Changes" : "Edit Workout")
                } icon: {
                    Image(systemName: isEditing ? "checkmark" : "pencil")
                }
                .animation(.smooth, value: isEditing)
            }
        }
    }
}

//#Preview {
//    WorkoutDetailView()
//}
