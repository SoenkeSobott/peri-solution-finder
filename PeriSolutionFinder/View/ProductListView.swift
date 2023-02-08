//
//  ProductsView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var network: Network
    @State private var searchText = ""
    var rootModel: RootModel

    var body: some View {
        Spacer()
        Text("Products")

        ZStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))
                .opacity(network.articlesLoading ? 1 : 0)

            VStack {
                TextField("Search", text: $searchText)
                List(searchResults, id: \.articleNumber) { article in
                    VStack {
                        Text(article.articleNumber)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .opacity(network.articlesLoading ? 0 : 1)
                .onAppear {
                    if (rootModel.shouldLoadArticles) {
                        network.getAllArticles()
                        rootModel.shouldLoadArticles = false
                    }
                }
                .refreshable {
                    network.getAllArticles()
                }
            }
        }
    }

    var searchResults: [Article] {
        if searchText.isEmpty {
            return network.articles
        } else {
            return network.articles.filter { $0.articleNumber.contains(searchText) }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(rootModel: RootModel())
    }
}
