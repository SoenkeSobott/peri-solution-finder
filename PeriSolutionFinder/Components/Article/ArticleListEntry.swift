//
//  ArticleListEntry.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 11.02.23.
//

import SwiftUI

struct ArticleListEntry: View {
    let article: Article
    @State var isDropdownOpen = false

    var body: some View {
        VStack(spacing: 0) {
            DisclosureGroup(
                isExpanded: $isDropdownOpen,
                content: {
                    HStack {
                        Spacer()
                        ArticleAvailabilityDropdown(isOpen: $isDropdownOpen, entries: article.childArticles ?? [])
                    }
                    .frame(width: UIScreen.main.bounds.width*0.8)
                }
            ) {
                HStack(spacing: 0) {
                    Group {
                        Text(article.articleNumber)
                            .text()
                            .padding([.leading, .trailing], 5)
                            .padding([.top, .bottom], 10)
                            .frame(width: UIScreen.main.bounds.width*0.17, alignment: .center)
                            .foregroundColor(.white)
                        Divider()
                        Text(article.articleDescription)
                            .text()
                            .padding([.leading, .trailing], 5)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width*0.25, alignment: .center)
                        Divider()
                    }

                    Group {
                        Text(formatPriceNumber(number: article.listPrice))
                            .text()
                            .padding([.leading, .trailing], 5)
                            .frame(width: UIScreen.main.bounds.width*0.18, alignment: .center)
                        Divider()
                        VStack {
                            HStack(spacing: 0) {
                                Text(formatNumber(number: Float(article.availability ?? 0)))
                                    .text()
                                    .padding([.leading, .trailing], 5)

                                Image(systemName: "circle.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor(getAvailabilityColor(availability: article.availability ?? 0))
                            }
                            .onTapGesture {
                                if (childArticlesPresent()) {
                                    isDropdownOpen.toggle()
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width*0.2, alignment: .center)
                        }
                    }
                }
                .padding(.leading, UIScreen.main.bounds.width*0.05)
            }

            Divider()
                .padding(0)
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }

    func getAvailabilityColor(availability: Int) -> Color {
        if (availability > 0) {
            return Color("InStockGreen")
        }
        return Color("OutOfStockRed")
    }

    private func childArticlesPresent() -> Bool {
        return article.childArticles?.count ?? 0 > 1
    }
}

struct ArticleListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListEntry(article: Article(articleNumber: "12345",
                                          articleDescription: "Test Description 1234",
                                          listPrice: 12.33,
                                          availability: 122,
                                          childArticles: [
                                            ChildArticle(articleNumber: "1234", availability: 1234),
                                            ChildArticle(articleNumber: "3453", availability: 2412)
                                          ]))
    }
}
