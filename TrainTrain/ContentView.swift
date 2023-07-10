//
//  ContentView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/8/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var workouts: [TTWorkout]

    @State var selectedWorkout: TTWorkout? = nil

    var body: some View {
        NavigationStack {
            List(workouts) { workout in
                NavigationLink(value: workout) {
                    Text(workout.name)
                }

            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        let workout = TTWorkout(name: "Upper Body || Pull Day \(workouts.count + 1)", summary: "")
                        context.insert(workout)
                    } label: {
                        Label("Add Workout", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(for: TTWorkout.self) { workout in
                WorkoutDetailView(workout: workout)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
