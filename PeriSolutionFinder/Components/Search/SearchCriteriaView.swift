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
    @State private var structureDropdownHeigth = CGFloat(100)

    var body: some View {
        ZStack {
            VStack {
                SearchProjectsField()

                HStack {
                    Button(action: {
                        searchModel.selectedCriteria = .Product
                        isStructureDropdownOpen = false
                        isSegmentDropdownOpen = false
                    }, label: {
                        Text("Product")
                            .searchCriteriaPillStyle(
                                isSelected: isSelected(searchCriteria: .Product),
                                isFilterSet: searchModel.isProductFilterSet(),
                                height: 40)
                    })
                    .accessibilityIdentifier("productButton")

                    Button(action: {
                        searchModel.selectedCriteria = .Structure
                        isSegmentDropdownOpen = false
                    }, label: {
                        ZStack(alignment: .trailing) {
                            Text("Structure")
                                .searchCriteriaPillStyle(
                                    isSelected: isSelected(searchCriteria: .Structure),
                                    isFilterSet: searchModel.isStructureFilterSet(),
                                    height: 40)

                            Button(action: {
                                searchModel.selectedCriteria = .Structure
                                isStructureDropdownOpen.toggle()
                                isSegmentDropdownOpen = false
                            }, label: {
                                Image(systemName: getDropdownImageName(
                                    isDropDownOpen: isStructureDropdownOpen, isFilterSet: searchModel.isStructureFilterSet()))
                                    .dropdownChevron(
                                        isSelected: isSelected(searchCriteria: .Structure),
                                        isFilterSet: searchModel.isStructureFilterSet())
                            })
                        }
                    })
                    .overlay(
                        HStack {
                            StructureDropdown(isOpen: $isStructureDropdownOpen)
                                .offset(y: (structureDropdownHeigth/2)+25)
                                .background(GeometryReader {gp -> Color in
                                    DispatchQueue.main.async {
                                        self.structureDropdownHeigth = gp.size.height
                                    }
                                    return Color.clear
                                })
                        }
                    )
                    .accessibilityIdentifier("structureButton")

                }
                .padding(.top, 10)
                .zIndex(20)

                HStack {
                    Button(action: {
                        searchModel.selectedCriteria = .Segment
                        isStructureDropdownOpen = false
                    }, label: {
                        ZStack(alignment: .trailing) {
                            Text("Segment")
                                .searchCriteriaPillStyle(
                                    isSelected: isSelected(searchCriteria: .Segment),
                                    isFilterSet: searchModel.isSegmentFilterSet(),
                                    height: 40)

                            Button(action: {
                                searchModel.selectedCriteria = .Segment
                                isStructureDropdownOpen = false
                                isSegmentDropdownOpen.toggle()
                            }, label: {
                                Image(systemName: getDropdownImageName(isDropDownOpen: isSegmentDropdownOpen, isFilterSet: searchModel.isSegmentFilterSet()))
                                    .dropdownChevron(
                                        isSelected: isSelected(searchCriteria: .Segment),
                                        isFilterSet: searchModel.isSegmentFilterSet())
                            })
                        }
                    })
                    .overlay(
                        HStack {
                            SegmentDropdown(isOpen: $isSegmentDropdownOpen)
                                .offset(y: 82)
                        }
                    )
                    .accessibilityIdentifier("segmentButton")


                    Button(action: {
                        searchModel.selectedCriteria = .Solution
                        isStructureDropdownOpen = false
                        isSegmentDropdownOpen = false
                    }, label: {
                        Text("Solution")
                            .searchCriteriaPillStyle(
                                isSelected: isSelected(searchCriteria: .Solution),
                                isFilterSet: searchModel.isSolutionFilterSet(),
                                height: 40)
                    })
                    .accessibilityIdentifier("solutionButton")
                }
                .padding(.top, 10)
            }
        }
        .onChange(of: searchModel.selectedCriteria) { newSelectedCriteria in
            if (newSelectedCriteria != .Structure) {
                isStructureDropdownOpen = false
            }
            if (newSelectedCriteria != .Segment) {
                isSegmentDropdownOpen = false
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
