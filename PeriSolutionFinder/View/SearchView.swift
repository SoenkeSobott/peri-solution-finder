//
//  SearchView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.11.22.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var searchModel: SearchModel
    private let searchViewHeight: CGFloat = UIScreen.main.bounds.height*0.35

    var body: some View {
        NavigationStack {
            // Necessary that keyboard doesn't lift the view
            // https://stackoverflow.com/questions/63958912/ios-14-swiftui-keyboard-lifts-view-automatically
            GeometryReader { _ in
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

                            SearchCriteriaView()
                        }
                        .frame(height: searchViewHeight)
                        .zIndex(10)

                        if (searchModel.selectedCriteria == SearchCriteria.Product) {
                            ProductFiltersView()
                        } else if (searchModel.selectedCriteria == SearchCriteria.Structure) {
                            if (searchModel.selectedStructure == Structure.Wall) {
                                WallFiltersView()
                            } else if (searchModel.selectedStructure == Structure.Column) {
                                ColumnFiltersView()
                            } else {
                                Text(searchModel.selectedStructure.rawValue)
                            }
                        } else if (searchModel.selectedCriteria == SearchCriteria.Segment) {
                            SegmentFiltersView()
                        } else if (searchModel.selectedCriteria == SearchCriteria.Solution) {
                            SolutionFiltersView()
                        }

                        Spacer()

                        Button(action: {
                            searchModel.resetSelectedCriteriaFilters()
                        }, label: {
                            Text("Reset")
                                .foregroundColor(Color("PeriRed"))
                                .fontWeight(.bold)
                                .frame(width: UIScreen.main.bounds.width*0.5, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color("PeriRed"), lineWidth: 3)
                                )
                                .background(Color.white)
                                .cornerRadius(50)
                                .shadow(color: Color("PeriRed").opacity(0.2), radius: 10, y: 5)
                                .padding(.bottom, 10)
                        })


                        FooterView()
                    }
                }
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(SearchModel())
    }
}
