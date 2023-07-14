//
//  ContentView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/8/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State var selectedTab: AppTab = .workouts

    var body: some View {
        TabView(selection: $selectedTab) {
            WorkoutsView()
                .tabItem {
                    Label("Workouts", systemImage: "dumbbell")
                }
                .tag(AppTab.workouts)

            Text("Community Tab")
                .tabItem {
                    Label("Community", systemImage: "figure.run.square.stack")
                }
                .tag(AppTab.community)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }.tag(AppTab.profile)
        }
    }
}

enum AppTab {
    case workouts, profile, community
}

//#Preview {
//    ContentView()
//}
