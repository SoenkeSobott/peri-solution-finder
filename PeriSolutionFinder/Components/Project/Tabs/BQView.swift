//
//  BQView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI

struct BQView: View {
    @EnvironmentObject var network: Network
    @ObservedObject var projectModel: ProjectModel
    let billOfQuantity: [BillOffQuantityEntry]
    @State private var columnsIndex = 0

    var body: some View {
        if (!billOfQuantity.isEmpty) {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    BQListHeader(columnsIndex: $columnsIndex)

                    List(billOfQuantity, id: \.id) { entry in
                        BQListEntryView(entry: entry, columnsIndex: $columnsIndex, articleAvailabilities: $projectModel.articleAvailabilities)
                    }
                    .scrollIndicators(.hidden)
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
                .frame(width: UIScreen.main.bounds.width*0.8)
                .background(Color("PeriLightGray"))
                .cornerRadius(15)
                .padding(.top, UIScreen.main.bounds.width*0.05)
                .padding(.bottom, UIScreen.main.bounds.width*0.05)

                AvailabilityLegendView()
                    .frame(width: UIScreen.main.bounds.width*0.9,
                           height: projectModel.articleAvailabilities.isEmpty ? 0 : 15)
                    .padding(.bottom, projectModel.articleAvailabilities.isEmpty ? 0 : UIScreen.main.bounds.width*0.05)
                    .opacity(projectModel.articleAvailabilities.isEmpty ? 0 : 1)
            }
            .frame(width: UIScreen.main.bounds.width*0.9)
            .cornerRadius(25)
            .onAppear {
                if (projectModel.shouldDownloadAvailabilities) {
                    projectModel.shouldDownloadAvailabilities = false
                    let articleNumbers: [String] = billOfQuantity.compactMap { $0.articleNumber }
                    network.getAvailabilityForArticles(articleNumbers: articleNumbers) { availabilities in
                        projectModel.articleAvailabilities = availabilities
                    }
                }
            }
        } else {
            NoDataView()
        }
    }
}

struct BQView_Previews: PreviewProvider {
    static var previews: some View {
        let billOfQuantity = [
            BillOffQuantityEntry(articleNumber: "231212", description: "my fancy descritpion", unit: "VG", quantity: 4, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "123423", description: "bla blub undos 123", unit: "VG", quantity: 2, weightPerUnit: 2),
            BillOffQuantityEntry(articleNumber: "234123", description: "so das aber nice", unit: "VG", quantity: 1232, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "23424", description: "so das aber nice", unit: "VG", quantity: 20001, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "342345", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "23456", description: "so das aber nice", unit: "VG", quantity: 234, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "123", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "12312323", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "12312323", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "12312323", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "12312323", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5)
        ]

        BQView(projectModel: ProjectModel(), billOfQuantity: billOfQuantity)
            .environmentObject(Network())
    }
}
