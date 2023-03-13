//
//  ProductsView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct ArticlesListView: View {
    @EnvironmentObject var network: Network
    var rootModel: RootModel
    @State private var searchText = ""

    var body: some View {
        VStack(spacing: 0) {
            ArticleListHeader()

            VStack {
                VStack {
                    ArticleListSearch(searchText: $searchText)
                        .padding(.top, UIScreen.main.bounds.width*0.05)
                        .zIndex(10)

                    VStack(spacing: 0) {
                        ArticlesListHeading()

                        if (network.articlesLoading) {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))
                                .opacity(network.articlesLoading ? 1 : 0)
                            Spacer()
                        } else if (!network.articlesLoading && network.articles.count == 0) {
                            Spacer()
                            Text("No Results")
                            Spacer()
                        } else {
                            HStack {
                                Color("PeriRed")
                                    .frame(width: UIScreen.main.bounds.width*0.17)
                                    .cornerRadius(15, corners: [.topLeft, .bottomLeft])
                                    .redViewShadow()
                                Spacer()
                            }
                            .overlay {
                                List(network.articles, id: \.self) { article in
                                    ArticleListEntry(article: article)
                                }
                                .cornerRadius(15, corners: [.topLeft, .bottomLeft])
                                .scrollContentBackground(.hidden)
                                .listStyle(.plain)
                                .opacity(network.articlesLoading ? 0 : 1)
                                .refreshable {
                                    network.getAllArticles(searchTerm: searchText)
                                }
                            }
                        }
                    }
                    .onAppear {
                        if (rootModel.shouldLoadArticles) {
                            network.getAllArticles(searchTerm: searchText)
                            rootModel.shouldLoadArticles = false
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width*0.8)
                .background(Color("PeriLightGray"))
                .cornerRadius(15)
                .padding([.top, .bottom], UIScreen.main.bounds.width*0.05)
            }
            .frame(width: UIScreen.main.bounds.width*0.9)
            .background(.white)
            .cornerRadius(25)
            .padding([.top, .bottom], UIScreen.main.bounds.width*0.05)
            .grayViewShadow()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color("BackgroundGray"))
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(rootModel: RootModel())
            .environmentObject(Network())
    }
}
