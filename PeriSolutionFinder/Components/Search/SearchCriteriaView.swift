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
                                    height: 40)

                            Button(action: {
                                searchModel.selectedCriteria = SearchCriteria.Structure
                                isStructureDropdownOpen.toggle()
                                isSegmentDropdownOpen = false
                            }, label: {
                                Image(systemName: isStructureDropdownOpen ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                    .resizable()
                                    .foregroundColor(isSelected(searchCriteria: SearchCriteria.Structure) ? Color("PeriRed") : .gray)
                                    .frame(width: 25, height: 25)
                                    .padding(.trailing, 7.5)
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
                                    height: 40)

                            Button(action: {
                                searchModel.selectedCriteria = SearchCriteria.Segment
                                isStructureDropdownOpen = false
                                isSegmentDropdownOpen.toggle()
                            }, label: {
                                Image(systemName: isSegmentDropdownOpen ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                    .resizable()
                                    .foregroundColor(
                                        isSelected(searchCriteria: SearchCriteria.Segment) ? Color("PeriRed") : .gray)
                                    .frame(width: 25, height: 25)
                                    .padding(.trailing, 7.5)
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
}

struct SearchCriteriaView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaView()
            .environmentObject(SearchModel())
    }
}
