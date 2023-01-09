//
//  SearchCriteriaView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 26.12.22.
//

import SwiftUI

struct SearchCriteriaView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State var isStructureDropdownOpen: Bool = false
    @State var isSegmentDropdownOpen: Bool = false

    var body: some View {
        ZStack {
            VStack {
                SearchField()

                HStack {
                    Button(action: {
                        searchModel.selectedCriteria = SearchCriteria.Product
                        isStructureDropdownOpen = false
                        isSegmentDropdownOpen = false
                    }, label: {
                        Text("Product")
                            .searchCriteriaPillStyle(
                                isSelected: isSelected(searchCriteria: SearchCriteria.Product),
                                isFilterSet: searchModel.isProductFilterSet(),
                                height: 40)
                    })

                    Button(action: {
                        searchModel.selectedCriteria = SearchCriteria.Structure
                        isSegmentDropdownOpen = false
                    }, label: {
                        ZStack(alignment: .trailing) {
                            Text("Structure")
                                .searchCriteriaPillStyle(
                                    isSelected: isSelected(searchCriteria: SearchCriteria.Structure),
                                    isFilterSet: searchModel.isStructureFilterSet(),
                                    height: 40)

                            Button(action: {
                                searchModel.selectedCriteria = SearchCriteria.Structure
                                isStructureDropdownOpen.toggle()
                                isSegmentDropdownOpen = false
                            }, label: {
                                Image(systemName: getDropdownImageName(
                                    isDropDownOpen: isStructureDropdownOpen, isFilterSet: searchModel.isStructureFilterSet()))
                                    .dropdownChevron(
                                        isSelected: isSelected(searchCriteria: SearchCriteria.Structure),
                                        isFilterSet: searchModel.isStructureFilterSet())
                            })
                        }
                    })
                    .overlay(
                        HStack {
                            StructureDropdown(isOpen: $isStructureDropdownOpen)
                                .offset(y: 95)
                        }
                    )
                }
                .padding(.top, 10)
                .zIndex(20)

                HStack {
                    Button(action: {
                        searchModel.selectedCriteria = SearchCriteria.Segment
                        isStructureDropdownOpen = false
                    }, label: {
                        ZStack(alignment: .trailing) {
                            Text("Segment")
                                .searchCriteriaPillStyle(
                                    isSelected: isSelected(searchCriteria: SearchCriteria.Segment),
                                    isFilterSet: searchModel.isSegmentFilterSet(),
                                    height: 40)

                            Button(action: {
                                searchModel.selectedCriteria = SearchCriteria.Segment
                                isStructureDropdownOpen = false
                                isSegmentDropdownOpen.toggle()
                            }, label: {
                                Image(systemName: getDropdownImageName(isDropDownOpen: isSegmentDropdownOpen, isFilterSet: searchModel.isSegmentFilterSet()))
                                    .dropdownChevron(
                                        isSelected: isSelected(searchCriteria: SearchCriteria.Segment),
                                        isFilterSet: searchModel.isSegmentFilterSet())
                            })
                        }
                    })
                    .overlay(
                        HStack {
                            SegmentDropdown(isOpen: $isSegmentDropdownOpen)
                                .offset(y: 80)
                        }
                    )

                    Button(action: {
                        searchModel.selectedCriteria = SearchCriteria.Solution
                        isStructureDropdownOpen = false
                        isSegmentDropdownOpen = false
                    }, label: {
                        Text("Solution")
                            .searchCriteriaPillStyle(
                                isSelected: isSelected(searchCriteria: SearchCriteria.Solution),
                                isFilterSet: searchModel.isSolutionFilterSet(),
                                height: 40)
                    })
                }
                .padding(.top, 10)
            }
        }
    }

    func isSelected(searchCriteria: SearchCriteria) -> Bool {
        return searchModel.selectedCriteria == searchCriteria
    }

    func getDropdownImageName(isDropDownOpen: Bool, isFilterSet: Bool) -> String{
        if (isFilterSet) {
            if (isDropDownOpen) {
                return "chevron.up.circle"
            }
            return "chevron.down.circle"
        }
        return isDropDownOpen ? "chevron.up.circle.fill" : "chevron.down.circle.fill"
    }
}

struct SearchCriteriaView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaView()
            .environmentObject(SearchModel())
    }
}
