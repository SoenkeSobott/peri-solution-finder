//
//  StructureFilterView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 25.01.23.
//

import SwiftUI

struct StructureFilterView: View {
    @EnvironmentObject var searchModel: SearchModel

    var body: some View {
        VStack {
            switch searchModel.getSelectedStructure() {
            case .Wall:
                WallFiltersView()
                    .frame(width: UIScreen.main.bounds.width*0.9)
            case .Column:
                ColumnFiltersView()
                    .frame(width: UIScreen.main.bounds.width*0.9)
            case .Culvert:
                CulvertFiltersView()
                    .frame(width: UIScreen.main.bounds.width*0.9)
            case .Shoring:
                ShoringFilterView()
                    .frame(width: UIScreen.main.bounds.width*0.9)
            }
        }
        .onDisappear {
            searchModel.setSelectedStructure(structure: nil)
        }
    }
}
