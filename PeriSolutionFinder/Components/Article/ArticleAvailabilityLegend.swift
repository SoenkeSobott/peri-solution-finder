//
//  ArticleAvailabilityLegend.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 15.03.23.
//

import SwiftUI

struct ArticleAvailabilityLegend: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "circle.fill")
                    .font(.system(size: 14))
                    .foregroundColor(Color("InStockGreen"))
                Text("Article available")
                    .text()
                Spacer()
            }

            HStack {
                Image(systemName: "circle.fill")
                    .font(.system(size: 14))
                    .foregroundColor(Color("OutOfStockRed"))

                Text("Article not available")
                    .text()
                Spacer()
            }

            HStack {
                ZStack {
                    Image(systemName: "circle")
                        .font(.system(size: 14))
                        .foregroundColor(Color("InStockGreen"))
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundColor(Color("InStockGreen"))
                }
                Text("Article or substitute available")
                    .text()
                Spacer()
            }

            HStack {
                ZStack {
                    Image(systemName: "circle")
                        .font(.system(size: 14))
                        .foregroundColor(Color("OutOfStockRed"))
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundColor(Color("OutOfStockRed"))
                }
                Text("Article and substitute not available")
                    .text()
                Spacer()
            }
        }
    }
}

struct ArticleAvailabilityLegend_Previews: PreviewProvider {
    static var previews: some View {
        ArticleAvailabilityLegend()
    }
}
