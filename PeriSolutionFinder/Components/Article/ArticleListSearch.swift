//
//  ArticleListSearch.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 13.03.23.
//

import SwiftUI

struct ArticleListSearch: View {
    @Binding var searchText: String
    @FocusState private var isSearchTextFocused: Bool
    @EnvironmentObject var network: Network
    @State private var isInfoButtonPressed = false
    @State private var infoTextHeight: CGFloat = 0
    private let padding = UIScreen.main.bounds.width*0.02
    
    var body: some View {
        HStack(alignment: .center, spacing: padding) {
            Spacer()
                .frame(width: 20)
                .padding(.leading, padding)

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

            Image(systemName: "info.circle")
                .font(.system(size: 20))
                .padding(.trailing, padding)
                .foregroundColor(.black)
                .onTapGesture {
                    isInfoButtonPressed.toggle()
                }

        }.overlay(alignment: .trailing) {
            GeometryReader { geometry in
                Text("Available quantity is only an indication and may not be up to date. It includes the material in stock, less confirmed customer orders. Customer returns, goods in transit and offers (regardless of probability) are not considered. Please confirm the quantity with your operations team before making commitments.")
                    .text()
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(5)
                    .background(
                        Bubble(tipDownDistanceFromRight: 10, tipUpDistanceFromRight:  10, tipDownAgainDistanceFromRight: 30)
                            .fill(.white)
                            .grayViewShadow()
                            .onAppear {
                                infoTextHeight = geometry.size.height
                            }
                        )
            }
            .frame(width: UIScreen.main.bounds.width*0.7)
            .offset(y: (infoTextHeight/2)+40)
            .opacity(isInfoButtonPressed ? 1 : 0)
        }
    }
}

struct ArticleListSearch_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListSearch(searchText: .constant("Test"))
            .environmentObject(Network())
    }
}
