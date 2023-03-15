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
        ZStack {
            Color("PeriLightGray").edgesIgnoringSafeArea(.top)
            Color.white
            
            VStack(spacing: 0) {
                ScrollView {
                    ZStack(alignment: .top) {
                        Image("Ellipse")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: UIScreen.main.bounds.width, height: searchViewHeight)

                        VStack(alignment: .center) {
                            VStack {
                                Text("Find your Reference Solution")
                                    .headline()
                                    .padding(.bottom, 20)
                                    .accessibilityIdentifier("searchHeading")

                                SearchCriteriaView()
                            }
                            .frame(height: searchViewHeight)
                            .zIndex(10)

                            switch searchModel.selectedCriteria {
                            case .Product:
                                ProductFiltersView()
                                    .frame(width: UIScreen.main.bounds.width*0.9)
                            case .Structure:
                                StructureFilterView()
                            case .Segment:
                                SegmentFiltersView()
                                    .frame(width: UIScreen.main.bounds.width*0.9)
                            case .Solution:
                                SolutionFiltersView()
                                    .frame(width: UIScreen.main.bounds.width*0.9)
                            }

                            Spacer()

                            ResetButton()
                                .padding(.bottom, 10)
                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(SearchModel())
    }
}
