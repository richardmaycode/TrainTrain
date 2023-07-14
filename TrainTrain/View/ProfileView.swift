//
//  ProfileView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/12/23.
//

import SwiftUI

struct ProfileView: View {

    @State var selectedTab: ProfileTab = .goal

    var body: some View {
        NavigationStack {
            VStack {
                headerView
                    .padding()
                buttonsView
                    .padding(.horizontal)
                TabView(selection: $selectedTab) {
                    Text("Goals Content").tag(ProfileTab.goal)
                    Text("Exercises Tab Content").tag(ProfileTab.exercise)
                    MeasurementsView().tag(ProfileTab.measure)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var headerView: some View {
        HStack {
            VStack {
                Text("Richard Wise")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(.title2, design: .default, weight: .semibold))
                
                
                Text("@RichardMayCode")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(.caption, design: .default, weight: .regular))
                    .foregroundStyle(.secondary)
            }

            Circle()
                .fill(Color(uiColor: .tertiarySystemFill))
                .frame(width: 50, height: 50, alignment: .center)
        }
    }

    private var buttonsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(ProfileTab.allCases) { tab in
                    Button {
                        withAnimation {
                            selectedTab = tab
                        }
                    } label: {
                        Label(tab.label, systemImage: tab.icon)
                            .foregroundStyle(selectedTab == tab ? .white : .black)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(selectedTab == tab ? .black : Color(uiColor: .quaternaryLabel))

                        
                    }
                }
            }
        }
    }
}

//#Preview {
//    ProfileView()
//}

enum ProfileTab: Int, Identifiable, CaseIterable {
    case goal, exercise, measure

    var id: Int { self.rawValue }

    var label: String {
        switch self {
        case .goal:
            "Goals"
        case .exercise:
            "Exercises"
        case .measure:
            "Measurements"
        }
    }

    var icon: String {
        switch self {
        case .goal:
            "target"
        case .exercise:
            "figure.run"
        case .measure:
            "ruler"
        }
    }

}
