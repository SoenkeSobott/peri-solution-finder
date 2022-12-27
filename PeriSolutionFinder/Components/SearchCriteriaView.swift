//
//  SearchCriteriaView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 26.12.22.
//

import SwiftUI

struct SearchCriteriaView: View {
    @Binding var searchTerm: String
    @Binding var selectedCriteria: SearchCriteria

    var body: some View {
        VStack {
            SearchField(searchTerm: $searchTerm)

            HStack {
                Button(action: {
                    selectedCriteria = SearchCriteria.product
                }, label: {
                    Text("Product")
                        .searchCriteriaPillStyle(isSelected: isProductSelected())
                })

                Button(action: {
                    selectedCriteria = SearchCriteria.structure
                }, label: {
                    Text("Structure")
                        .searchCriteriaPillStyle(isSelected: isStructureSelected())
                })

            }
            .padding(.top, 10)
        }
    }

    func isProductSelected() -> Bool {
        return selectedCriteria == SearchCriteria.product
    }

    func isStructureSelected() -> Bool {
        return selectedCriteria == SearchCriteria.structure
    }
}

struct SearchCriteriaView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaView(searchTerm: .constant(""), selectedCriteria: .constant(SearchCriteria.product))
    }
}
