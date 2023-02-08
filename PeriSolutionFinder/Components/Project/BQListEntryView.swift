//
//  BQListEntryView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct BQListEntryView: View {
    @State var entry: BillOffQuantityEntry
    @Binding var columnsIndex: Int
    @Binding var articleAvailabilities: [ArticleAvailability]

    var body: some View {
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

            HStack(spacing: 0) {
                Text(entry.quantity?.description ?? "-")
                    .text()
                    .lineLimit(1)
                    .frame(width: 40)

                Image(systemName: "circle.fill")
                    .font(.system(size: 10))
                    .foregroundColor(getAvailabilityColor(bqEntry: entry))
            }
            .frame(width: UIScreen.main.bounds.width*0.2, alignment: .center)
        }
        .frame(width: UIScreen.main.bounds.width*0.8)
        .listRowBackground(Color.clear)
    }

    func getAvailabilityColor(bqEntry: BillOffQuantityEntry) -> Color {
        let availability = articleAvailabilities.first { $0.articleNumber == bqEntry.articleNumber }
        if (articleAvailabilities.isEmpty) {
            return .clear
        }
        if (availability != nil) {
            if (availability!.availability >= bqEntry.quantity ?? 0) {
                return Color("InStockGreen")
            }
            return Color("OutOfStockYellow")
        }
        return Color("OutOfStockYellow")
    }
}

struct BQListEntryView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = BillOffQuantityEntry(articleNumber: "1234", description: "Test description", unit: "VC", quantity: 20, weightPerUnit: 12.2)
        BQListEntryView(entry: entry, columnsIndex: .constant(1), articleAvailabilities: .constant([]))
    }
}
