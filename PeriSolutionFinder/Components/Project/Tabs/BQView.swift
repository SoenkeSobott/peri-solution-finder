//
//  BQView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI

struct BQView: View {
    @EnvironmentObject var network: Network
    let billOfQuantity: [BillOffQuantityEntry]
    @State private var articleAvailabilities: [ArticleAvailability] = []
    @State private var columnsIndex = 0

    var body: some View {
        if (!billOfQuantity.isEmpty) {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    BQListHeader(columnsIndex: $columnsIndex)

                    List(billOfQuantity, id: \.id) { entry in
                        BQListEntryView(entry: entry, columnsIndex: $columnsIndex, articleAvailabilities: $articleAvailabilities)
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

                HStack {
                    Image(systemName: "capsule.fill")
                        .font(.system(size: 15))
                        .foregroundColor(Color("InStockGreen"))
                        .padding(.leading, UIScreen.main.bounds.width*0.05)

                    Text("In Stock")
                        .text()

                    Image(systemName: "capsule.fill")
                        .font(.system(size: 15))
                        .foregroundColor(Color("OutOfStockYellow"))

                    Text("Out Of Stock")
                        .text()

                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width*0.9,
                       height: articleAvailabilities.isEmpty ? 0 : 15)
                .padding(.bottom, articleAvailabilities.isEmpty ? 0 : UIScreen.main.bounds.width*0.05)
                .opacity(articleAvailabilities.isEmpty ? 0 : 1)
            }
            .frame(width: UIScreen.main.bounds.width*0.9)
            .cornerRadius(25)
            .onAppear {
                let articleNumbers: [String] = billOfQuantity.compactMap { $0.articleNumber }
                network.getAvailabilityForArticles(articleNumbers: articleNumbers) { availabilities in
                    articleAvailabilities = availabilities
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
        BQView(billOfQuantity: billOfQuantity)
            .environmentObject(Network())
    }
}
