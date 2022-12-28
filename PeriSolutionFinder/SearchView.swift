//
//  SearchView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.11.22.
//

import SwiftUI

struct SearchView: View {
    @State private var searchTerm: String = ""
    @State private var selectedCriteria: SearchCriteria = SearchCriteria.Product
    private let searchViewHeight: CGFloat = UIScreen.main.bounds.height*0.3
    @State var structureElements: [Structure] = [Structure.Wall, Structure.Column, Structure.Slob]
    @State var selectedStructure: Structure = Structure.Wall

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Image("Ellipse")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: searchViewHeight)

                VStack(alignment: .center) {

                    VStack {
                        Text("Find your Reference Solution")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                            .font(Font.system(size: 22, weight: .medium, design: .default))
                            .padding(.bottom, 20)

                        SearchCriteriaView(searchTerm: $searchTerm,
                                           selectedCriteria: $selectedCriteria,
                                           structureElements: $structureElements,
                                           selectedStructure: $selectedStructure)
                    }
                    .frame(height: searchViewHeight)
                    .zIndex(10)

                    Text(getHeadlineForSelectedSearchCriteria())
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .font(Font.system(size: 22, weight: .medium, design: .default))
                        .padding(.bottom, 0)
                        .padding(.leading, UIScreen.main.bounds.width*0.05)
                        .padding(.trailing, UIScreen.main.bounds.width*0.05)


                    SearchCriteriaFiltersView(selectedCriteria: $selectedCriteria, selectedStructure: $selectedStructure)
                        .zIndex(0)


                    Spacer()

                    FooterView()
                }
            }
        }
    }
    
    func getHeadlineForSelectedSearchCriteria() -> String {
        if (selectedCriteria == SearchCriteria.Product) {
            return "Search by Name"
        } else if (selectedCriteria == SearchCriteria.Structure) {
            return selectedStructure.rawValue
        } else {
            return "No Selection"
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
