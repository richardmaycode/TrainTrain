//
//  MeasurementsView.swift
//  TrainTrain
//
//  Created by Richard Wise on 7/12/23.
//

import SwiftUI
import SwiftData

struct MeasurementsView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \TTMeasurementRecord.measured, order: .reverse) var measurementRecords: [TTMeasurementRecord]
    @State var addingMeasurements: Bool = false

    var currentRecord: TTMeasurementRecord? {
        measurementRecords.first
    }

    var body: some View {
        VStack {
            if measurementRecords.isEmpty {
                ContentUnavailableView("No Measurements Found", systemImage: "doc.text", description: Text("Add your measurements to see current details and trends."))
            } else {
                HStack {
                    Text("Last Record")
                        .font(.title)

                    Spacer()

                    Menu {
                        Button {
                            print("Edit")
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }

                        Button {
                            print("Share")
                        } label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }

                        Button(role: .destructive) {
                            print("Delete")
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    } label: {
                        Label("Options", systemImage: "ellipsis")
                            .labelStyle(.iconOnly)
                            .foregroundStyle(.black)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(uiColor: .quaternaryLabel))
                            }
                    }
                }
                .padding([.horizontal, .bottom])
                .padding(.top, 8)

                ScrollView {
                    Grid(alignment:.leading, verticalSpacing: 12) {
                        GridRow {
                            NavigationLink {
                                Text("Neck Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Neck")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)

                            }


                            NavigationLink {
                                Text("Chest Trend Data")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Chest")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                        Divider()
                            .gridCellUnsizedAxes(.horizontal)

                        GridRow {
                            Text("\(currentRecord?.neck ?? 0, format: .number)")
                            
                            Text("\(currentRecord?.chest ?? 0, format: .number)")
                        }
                        
                        GridRow {
                            NavigationLink {
                                Text("Right Arm Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Right Arm")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)

                            }

                            NavigationLink {
                                Text("Left Arm Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Left Arm")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }
                        }
                        .font(.headline)
                        
                        Divider()
                            .gridCellUnsizedAxes(.horizontal)
                        
                        GridRow {
                            Text("\(currentRecord?.rightArm ?? 0, format: .number)")
                            
                            Text("\(currentRecord?.leftArm ?? 0, format: .number)")
                        }

                        GridRow {
                            NavigationLink {
                                Text("Waist Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Waist")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }

                            NavigationLink {
                                Text("Hips Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Hips")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }
                        }
                        .font(.headline)

                        Divider()
                            .gridCellUnsizedAxes(.horizontal)

                        GridRow {
                            Text("\(currentRecord?.waist ?? 0, format: .number)")

                            Text("\(currentRecord?.hips ?? 0, format: .number)")
                        }

                        GridRow {
                            NavigationLink {
                                Text("Right Thigh Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Right Thigh")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }

                            NavigationLink {
                                Text("Left Thigh Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Left Thigh")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }
                        }
                        .font(.headline)

                        Divider()
                            .gridCellUnsizedAxes(.horizontal)

                        GridRow {
                            Text("\(currentRecord?.rightThigh ?? 0, format: .number)")

                            Text("\(currentRecord?.leftThigh ?? 0, format: .number)")
                        }

                        GridRow {
                            NavigationLink {
                                Text("Body Fat Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Body Fat")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }

                            NavigationLink {
                                Text("Lean Tissue Trend Page")
                            } label: {
                                LabeledContent {
                                    Image(systemName: "chevron.right")
                                } label: {
                                    Text("Lean Tissue")
                                }
                                .padding(.trailing)
                                .foregroundColor(.black)
                            }
                        }
                        .font(.headline)

                        Divider()
                            .gridCellUnsizedAxes(.horizontal)

                        GridRow {
                            Text("\(currentRecord?.bodyFat ?? 0, format: .number)")

                            Text("\(currentRecord?.leanTissue ?? 0, format: .number)")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                }
            }


            Spacer()
            if currentRecord != nil {
                Text("Logged: \(currentRecord?.measured.formatted(date: .numeric, time: .shortened) ?? "")")
                    .font(.caption2)
            }
            Button {
                addingMeasurements = true
            } label: {
                Label("Add Measurements", systemImage: "plus")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.black)
            }
            .padding(.bottom, 4)
        }
        .sheet(isPresented: $addingMeasurements) {
            AddMeasurementsView(onAdd: { measurement in addMeasurement(measurement)})
        }
    }

    func addMeasurement(_ measurement: TTMeasurementRecord) {
        context.insert(measurement)
        addingMeasurements = false
    }
}

//#Preview {
//    MeasurementsView()
//}
