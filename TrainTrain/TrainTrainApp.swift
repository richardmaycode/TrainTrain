//
//  TrainTrainApp.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/8/23.
//

import SwiftUI

@main
struct TrainTrainApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [TTWorkout.self])
        }
    }
}
