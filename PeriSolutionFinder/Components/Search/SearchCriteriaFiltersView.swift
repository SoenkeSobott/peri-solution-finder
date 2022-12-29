//
//  SearchCriteriaFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct SearchCriteriaFiltersView: View {
    @EnvironmentObject var searchModel: SearchModel

    var body: some View {
        VStack {
            if (searchModel.selectedCriteria == SearchCriteria.Product) {
                HStack {
                    ProductSelectionBoxView()
                        .padding(.leading, 20)

                    Spacer()
                }
            } else {
                if (searchModel.selectedStructure == Structure.Wall) {
                    WallCriteriaView()
                } else {
                    Text(searchModel.selectedStructure.rawValue)
                }
            }
        }
    }
}

struct SearchCriteriaFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaFiltersView()
            .environmentObject(SearchModel())
    }
}
