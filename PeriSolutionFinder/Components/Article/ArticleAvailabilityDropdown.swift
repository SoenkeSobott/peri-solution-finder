//
//  ArticleAvailabilityDropdown.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 06.03.23.
//

import SwiftUI

struct ArticleAvailabilityDropdown: View {
    @Binding var isOpen: Bool
    let entries: [ChildArticle]
    @State private var totalAvailability: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Bubble()
                    .fill(.white)
                    .grayViewShadow()

                VStack(spacing: 0) {
                    ForEach(entries, id: \.self) { entry in
                        HStack(spacing: 0) {
                            Text(entry.articleNumber)
                                .text()
                                .frame(width: UIScreen.main.bounds.width*0.15, alignment: .trailing)
                                .padding(.trailing, 10)
                            Text(formatNumber(number: Float(entry.availability ?? 0)))
                                .text()
                                .frame(width: UIScreen.main.bounds.width*0.15, alignment: .leading)
                        }
                        .frame(height: 30)
                        .background(.white)
                    }
                    HStack(spacing: 0) {
                        Text("Total:")
                            .headlineThree()
                            .frame(width: UIScreen.main.bounds.width*0.15, alignment: .trailing)
                            .padding(.trailing, 10)
                        Text(formatNumber(number: Float(totalAvailability)))
                            .headlineThree()
                            .frame(width: UIScreen.main.bounds.width*0.15, alignment: .leading)
                    }
                    .frame(height: 30)
                    .background(.white)
                }
            }
        }
        .padding(5)
        .frame(width: UIScreen.main.bounds.width*0.4,
               height: entries.count > 0 ? nil : 0)
        .opacity(isOpen ? 1 : 0)
        .onAppear {
            calculateTotalAvailability()
        }
    }

    private func calculateTotalAvailability() {
        entries.forEach { entry in
            totalAvailability+=entry.availability ?? 0
        }
    }
}



struct ArticleAvailabilityDropdown_Previews: PreviewProvider {
    static var previews: some View {
        ArticleAvailabilityDropdown(isOpen: .constant(true), entries: [
            ChildArticle(articleNumber: "1234", availability: 1234),
            ChildArticle(articleNumber: "3453", availability: 2412)
        ])

    }
}
