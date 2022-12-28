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
    @Binding var structureElements: [Structure]
    @Binding var selectedStructure: Structure
    @State var isStructureDropdownOpen: Bool = false

    var body: some View {
        VStack {
            SearchField(searchTerm: $searchTerm)

            HStack {
                Button(action: {
                    selectedCriteria = SearchCriteria.Product
                    isStructureDropdownOpen = false
                }, label: {
                    Text("Product")
                        .searchCriteriaPillStyle(isSelected: isProductSelected(), height: 40)
                })

                Button(action: {
                    selectedCriteria = SearchCriteria.Structure
                }, label: {
                    ZStack(alignment: .trailing) {
                        Text("Structure")
                            .searchCriteriaPillStyle(isSelected: isStructureSelected(), height: 40)

                        Button(action: {
                            selectedCriteria = SearchCriteria.Structure
                            isStructureDropdownOpen = !isStructureDropdownOpen
                        }, label: {
                            Image(systemName: isStructureDropdownOpen ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                .resizable()
                                .foregroundColor(isStructureSelected() ? Color("PeriRed") : .gray)
                                .frame(width: 25, height: 25)
                                .padding(.trailing, 7.5)
                        })
                    }
                })
                .overlay(
                    HStack {
                        Dropdown(isSelected: .constant(isStructureSelected()),
                                 structureElements: $structureElements,
                                 selectedStructure: $selectedStructure,
                                 isOpen: $isStructureDropdownOpen)
                            .offset(y: 70)
                    }
                )
            }
            .padding(.top, 10)
        }
    }

    func isProductSelected() -> Bool {
        return selectedCriteria == SearchCriteria.Product
    }

    func isStructureSelected() -> Bool {
        return selectedCriteria == SearchCriteria.Structure
    }
}

struct SearchCriteriaView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaView(searchTerm: .constant(""),
                           selectedCriteria: .constant(SearchCriteria.Structure),
                           structureElements: .constant([Structure.Wall, Structure.Slob, Structure.Column]),
                           selectedStructure: .constant(Structure.Slob))
    }
}
