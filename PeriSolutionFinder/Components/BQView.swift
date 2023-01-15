//
//  BQView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI

struct BQView: View {

    let billOfQuantity: [BillOffQuantityEntry]
    @State private var columnsIndex = 0

    var body: some View {

        VStack {

            BQListHeader(columnsIndex: $columnsIndex)

            if (!billOfQuantity.isEmpty) {
                List(billOfQuantity, id: \.id) { entry in
                    HStack {
                        Text(entry.articleNumber ?? "")
                            .padding(.leading, 5)
                            .frame(width: UIScreen.main.bounds.width*0.22, alignment: .center)
                            .lineLimit(1)

                        Divider()
                        Spacer()

                        HStack {
                            if columnsIndex == 0 {
                                Text(entry.description ?? "")
                            } else if columnsIndex == 1 {
                                Text(entry.unit ?? "")
                                    .lineLimit(1)
                            } else if columnsIndex == 2 {
                                Text(String(entry.weightPerUnit ?? 0))
                                    .lineLimit(1)
                            }

                        }
                        Spacer()
                        Divider()

                        Text(String(entry.quantity ?? 0))
                            .padding(.trailing, 5)
                            .frame(width: UIScreen.main.bounds.width*0.22, alignment: .center)
                            .lineLimit(1)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.9)
                    .listRowBackground(Color.clear)
                }
                .padding(.top, 0)
                .scrollContentBackground(.hidden)
                .listStyle(.plain)

            } else {
                Spacer()
                VStack(spacing: 20) {
                    Text("Sorry!")
                    Text("There is no data for this project.")
                }
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
        .cornerRadius(25)
    }
}

struct BQView_Previews: PreviewProvider {
    static var previews: some View {
        let billOfQuantity = [
            BillOffQuantityEntry(articleNumber: "12312323", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "Startnumber", description: "bla blub undos 123", unit: "VG", quantity: 20, weightPerUnit: 2),
            BillOffQuantityEntry(articleNumber: "789", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9)
        ]
        BQView(billOfQuantity: billOfQuantity)
    }
}
