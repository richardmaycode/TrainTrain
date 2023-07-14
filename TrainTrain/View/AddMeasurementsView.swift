//
//  AddMeasurementsView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/12/23.
//

import SwiftUI

struct AddMeasurementsView: View {

    @Environment(\.dismiss) var dismiss

    @State var neck: Double = 0.0
    @State var chest: Double = 0.0
    @State var rightArm: Double = 0.0
    @State var leftArm: Double = 0.0

    @State var waist: Double = 0.0
    @State var hips: Double = 0.0

    @State var rightThigh: Double = 0.0
    @State var leftThigh: Double = 0.0

    @State var weight: Double = 0.0
    @State var bodyfat: Double = 0.0
    @State var leanTissue: Double = 0.0

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    let onAdd: (TTMeasurementRecord) -> Void?

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Neck")
                    Spacer()
                    TextField("Neck", value: $neck, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)
                HStack {
                    Text("Chest")
                    Spacer()
                    TextField("Chest", value: $chest, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Right Arm")
                    Spacer()
                    TextField("Right Arm", value: $rightArm, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Left Arm")
                    Spacer()
                    TextField("Left Arm", value: $leftArm, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Waist")
                    Spacer()
                    TextField("Waist", value: $waist, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Hips")
                    Spacer()
                    TextField("Hips", value: $hips, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Right Leg")
                    Spacer()
                    TextField("Right Leg", value: $rightThigh, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Left Leg")
                    Spacer()
                    TextField("Left Leg", value: $leftThigh, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Weight")
                    Spacer()
                    TextField("Weight", value: $weight, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)
                HStack {
                    Text("Body Fat Percentage")
                    Spacer()
                    TextField("Body Fat %", value: $bodyfat, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)

                HStack {
                    Text("Lean Tissue Percent")
                    Spacer()
                    TextField("Lean Tissue %", value: $leanTissue, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .background(.background)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 50, alignment: .trailing)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Adding Measurements")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        submit()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }

    func submit() {
        let measurement = TTMeasurementRecord(
            neck: neck == 0 ? nil : neck,
            chest: chest == 0 ? nil : chest,
            rightArm: rightArm == 0 ? nil : rightArm,
            leftArm: leftArm == 0 ? nil : leftArm,
            waist: waist == 0 ? nil : waist,
            hips: hips == 0 ? nil : hips,
            rightThigh: rightThigh == 0 ? nil : rightThigh,
            leftThigh: leftThigh == 0 ? nil : leftThigh,
            weight: weight == 0 ? nil : weight,
            bodyFat: bodyfat == 0 ? nil : bodyfat,
            leanTissue: leanTissue == 0 ? nil : leanTissue,
            measured: .now
        )

        onAdd(measurement)
    }
}

//#Preview {
//    AddMeasurementsView()
//}
