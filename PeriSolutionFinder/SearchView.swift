//
//  SearchView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.11.22.
//

import SwiftUI

enum SearchCriteria {
    case product
    case structure
}

struct SearchView: View {
    @State private var searchTerm: String = ""
    @State private var selectedCriteria: SearchCriteria = SearchCriteria.product
    private let searchViewHeight: CGFloat = UIScreen.main.bounds.height*0.3

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
                                           selectedCriteria: $selectedCriteria)
                        
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


                    if (selectedCriteria == SearchCriteria.product) {
                        HStack {
                            ProductSelectionBoxView()
                                .padding(.leading, 20)

                            Spacer()
                        }
                    } else {
                        VStack {
                            Text("Thickness")
                            Text("Height")
                        }
                    }

                    Spacer()

                    if (selectedCriteria == SearchCriteria.structure) {
                        Button(action: {
                            print("Add to search")
                        }, label: {
                            Text("Add to Search")
                                .foregroundColor(Color("PeriRed"))
                                .fontWeight(.bold)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: 60)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color("PeriRed"), lineWidth: 3)
                                )
                                .background(Color.white)
                                .cornerRadius(50)
                                .shadow(color: Color("PeriRed").opacity(0.2), radius: 10, y: 5)
                                .padding(.bottom, 20)
                        })
                    }

                    FooterView()
                }
            }
        }
    }
    
    func getHeadlineForSelectedSearchCriteria() -> String {
        if (selectedCriteria == SearchCriteria.product) {
            return "Search by Name"
        } else if (selectedCriteria == SearchCriteria.structure) {
            return "Wall"
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
