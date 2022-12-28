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
    @State var structureElementsSelectedIndex: Int = 0

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
                                           structureElementsSelectedIndex: $structureElementsSelectedIndex)
                        
                    }
                    .frame(height: searchViewHeight)

                    Text(getHeadlineForSelectedSearchCriteria())
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .font(Font.system(size: 22, weight: .medium, design: .default))
                        .padding(.bottom, 0)
                        .padding(.leading, UIScreen.main.bounds.width*0.05)
                        .padding(.trailing, UIScreen.main.bounds.width*0.05)


                    if (selectedCriteria == SearchCriteria.Product) {
                        HStack {
                            ProductSelectionBoxView()
                                .padding(.leading, 20)

                            Spacer()
                        }
                    } else {
                        if (structureElements[structureElementsSelectedIndex] == Structure.Wall) {
                            WallCriteriaView()
                        } else {
                            Text(structureElements[structureElementsSelectedIndex].rawValue)
                        }
                    }

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
            return structureElements[structureElementsSelectedIndex].rawValue
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
