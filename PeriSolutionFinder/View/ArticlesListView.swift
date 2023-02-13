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
    @FocusState private var isSearchTextFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            ArticleListHeader()

            VStack {
                VStack {
                    ZStack(alignment: .trailing) {
                        TextField("Search Articles", text: $searchText)
                            .font(Font.system(size: 18, weight: .medium, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 40)
                            .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 55))
                            .background(Color.white)
                            .cornerRadius(50)
                            .focused($isSearchTextFocused)
                            .grayViewShadow()
                            .submitLabel(.search)
                            .onSubmit {
                                network.getAllArticles(searchTerm: searchText)
                            }

                        Button(action: {
                            network.getAllArticles(searchTerm: searchText)
                            isSearchTextFocused = false
                        }, label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color("PeriRed"))
                                .background(.white)
                                .clipShape(Circle())
                                .redViewShadow()
                                .padding(.trailing, 10)
                        })
                    }
                    .onTapGesture {
                        isSearchTextFocused = true
                    }
                    .padding([.leading, .trailing, .top], UIScreen.main.bounds.width*0.05)

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
