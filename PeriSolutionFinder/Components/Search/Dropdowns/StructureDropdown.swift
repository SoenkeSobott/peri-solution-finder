//
//  Dropdown.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct StructureDropdown: View {
    @EnvironmentObject var searchModel: SearchModel
    @Binding var isOpen: Bool
    @State private var showingFeatureNotImplementedAlert: Bool = false

    var body: some View {
        VStack {
            ForEach(searchModel.structureElements(), id: \.self) { structure in
                Button(action: {
                    searchModel.setSelectedStructure(structure: structure)
                    isOpen = false
                }, label: {
                    Text(structure.rawValue)
                        .text()
                        .padding(2)
                        .foregroundColor(structure == searchModel.getSelectedStructure() ? Color("PeriRed") : .gray)

                })
            }
        }
        .padding(5)
        .frame(width: UIScreen.main.bounds.width*0.4)
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
        .grayViewShadow()
        .opacity(isOpen ? 1 : 0)
    }
}

struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        StructureDropdown(isOpen: .constant(true))
            .environmentObject(SearchModel())
    }
}
