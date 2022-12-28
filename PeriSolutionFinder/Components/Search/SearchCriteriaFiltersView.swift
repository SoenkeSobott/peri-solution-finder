//
//  SearchCriteriaFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct SearchCriteriaFiltersView: View {
    @Binding var selectedCriteria: SearchCriteria
    @Binding var selectedStructure: Structure
    
    var body: some View {
        VStack {
            if (selectedCriteria == SearchCriteria.Product) {
                HStack {
                    ProductSelectionBoxView()
                        .padding(.leading, 20)

                    Spacer()
                }
            } else {
                if (selectedStructure == Structure.Wall) {
                    WallCriteriaView()
                } else {
                    Text(selectedStructure.rawValue)
                }
            }
        }
    }
}

struct SearchCriteriaFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaFiltersView(selectedCriteria: .constant(SearchCriteria.Structure), selectedStructure: .constant(Structure.Wall))
    }
}
