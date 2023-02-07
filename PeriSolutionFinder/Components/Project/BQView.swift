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
        if (!billOfQuantity.isEmpty) {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    BQListHeader(columnsIndex: $columnsIndex)

                    List(billOfQuantity, id: \.id) { entry in
                        HStack {
                            Text(entry.articleNumber ?? "")
                                .text()
                                .padding(.leading, 5)
                                .frame(width: UIScreen.main.bounds.width*0.2, alignment: .center)
                                .lineLimit(1)

                            Divider()
                            Spacer()

                            HStack {
                                if columnsIndex == 0 {
                                    Text(entry.description ?? "")
                                        .text()
                                } else if columnsIndex == 1 {
                                    Text(entry.unit ?? "")
                                        .text()
                                        .lineLimit(1)
                                } else if columnsIndex == 2 {
                                    Text(String(entry.weightPerUnit ?? 0))
                                        .text()
                                        .lineLimit(1)
                                }

                            }
                            Spacer()
                            Divider()

                            Text(entry.quantity?.description ?? "-")
                                .text()
                                .padding(.trailing, 5)
                                .frame(width: UIScreen.main.bounds.width*0.2, alignment: .center)
                                .lineLimit(1)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.8)
                        .listRowBackground(Color.clear)
                    }
                    .padding(.top, 0)
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
                .frame(width: UIScreen.main.bounds.width*0.9)
                .padding(.bottom, UIScreen.main.bounds.width*0.05)
            }
            .frame(width: UIScreen.main.bounds.width*0.9)
            .cornerRadius(25)
        } else {
            Spacer()
            VStack(spacing: 20) {
                Text("Sorry!")
                    .text()
                Text("There is no data for this project.")
                    .text()
            }
            Spacer()
        }
    }
}

struct BQView_Previews: PreviewProvider {
    static var previews: some View {
        let billOfQuantity = [
            BillOffQuantityEntry(articleNumber: "231212", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "123423", description: "bla blub undos 123", unit: "VG", quantity: 20, weightPerUnit: 2),
            BillOffQuantityEntry(articleNumber: "234123", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "23424", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
            BillOffQuantityEntry(articleNumber: "342345", description: "my fancy descritpion", unit: "VG", quantity: 20, weightPerUnit: 5),
            BillOffQuantityEntry(articleNumber: "23456", description: "so das aber nice", unit: "VG", quantity: 20, weightPerUnit: 9),
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
    }
}
