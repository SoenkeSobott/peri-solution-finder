//
//  ProductFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 03.01.23.
//

import SwiftUI

struct ProductFiltersView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Search by Product")
                .filterHeadlineStyle()

            HStack {
                ProductSelectionBoxView(product: .DUO)
                Spacer()
                ProductSelectionBoxView(product: .PS100)
            }
        }
    }
}

struct ProductFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFiltersView()
    }
}
