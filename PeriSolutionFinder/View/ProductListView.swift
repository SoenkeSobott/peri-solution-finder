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
        VStack {
            Text("Products")
                .headline()
                .padding(10)

            ZStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))
                    .opacity(network.articlesLoading ? 1 : 0)

                VStack {
                    ZStack(alignment: .trailing) {
                        TextField("Search Articles", text: $searchText)
                            .font(Font.system(size: 18, weight: .medium, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 40)
                            .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 55))
                            .background(Color.white)
                            .cornerRadius(50)
                            .shadow(color: .black.opacity(0.05), radius: 50)
                            .submitLabel(.done)

                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(Color("PeriRed"))
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(color: Color("PeriRed").opacity(0.2), radius: 5)
                            .padding(.trailing, 10)
                    }
                    .padding(.leading, UIScreen.main.bounds.width*0.05)
                    .padding(.trailing, UIScreen.main.bounds.width*0.05)

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
            .environmentObject(Network())
    }
}
