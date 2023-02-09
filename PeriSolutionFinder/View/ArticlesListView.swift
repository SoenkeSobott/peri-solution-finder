//
//  ProductsView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct ArticlesListView: View {
    @EnvironmentObject var network: Network
    @State private var searchText = ""
    var rootModel: RootModel

    var body: some View {
        VStack(spacing: 0) {
            Text("Articles")
                .headline()
                .padding(10)

            ZStack(alignment: .trailing) {
                TextField("Search Articles", text: $searchText)
                    .font(Font.system(size: 18, weight: .medium, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 55))
                    .background(Color.white)
                    .cornerRadius(50)
                    .grayViewShadow()
                    .submitLabel(.done)

                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(Color("PeriRed"))
                    .background(.white)
                    .clipShape(Circle())
                    .redViewShadow()
                    .padding(.trailing, 10)
            }
            .padding([.leading, .trailing], UIScreen.main.bounds.width*0.05)

            ZStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))
                    .opacity(network.articlesLoading ? 1 : 0)

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
            .frame(width: UIScreen.main.bounds.width*0.9)
            .background(.white)
            .cornerRadius(25)
            .padding([.top, .bottom], UIScreen.main.bounds.width*0.05)
            .grayViewShadow()
        }
        .background(Color("BackgroundGray"))
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
        ArticlesListView(rootModel: RootModel())
            .environmentObject(Network())
    }
}
