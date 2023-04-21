//
//  ArticleListEntry.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 11.02.23.
//

import SwiftUI

struct ArticleListEntry: View {
    let article: Article
    @State private var isDropdownOpen = false
    @Binding var selectedArticle: String

    var body: some View {
        VStack(spacing: 0) {
            DisclosureGroup(
                isExpanded: $isDropdownOpen,
                content: {
                    HStack {
                        Spacer()
                        ArticleAvailabilityDropdown(isOpen: $isDropdownOpen, entries: article.substituteArticles ?? [])
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
                        Text(article.articleDescription ?? "")
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

                        HStack(spacing: 0) {
                            Text(formatNumber(number: Float(article.availability ?? 0)))
                                .text()
                                .frame(width: UIScreen.main.bounds.width*0.14, alignment: .center)

                            ZStack {
                                Image(systemName: "circle")
                                    .font(.system(size: 14))
                                    .foregroundColor(getAvailabilityColor(article: article))
                                    .opacity(substituteArticlesPresent() ? 1 : 0)
                                Image(systemName: "circle.fill")
                                    .font(.system(size: substituteArticlesPresent() ? 8 : 14))
                                    .foregroundColor(getAvailabilityColor(article: article))
                            }
                            .frame(width: UIScreen.main.bounds.width*0.06, alignment: .center)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.2, alignment: .center)
                        .onTapGesture {
                            if (substituteArticlesPresent() && selectedArticle != article.articleNumber) {
                                selectedArticle = article.articleNumber
                            } else {
                                selectedArticle = ""
                            }
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
        .onChange(of: selectedArticle) { newValue in
            isDropdownOpen = selectedArticle == article.articleNumber
        }
    }

    private func getAvailabilityColor(article: Article) -> Color {
        if (article.availability ?? 0 > 0) {
            return Color("InStockGreen")
        } else if (substituteArticlesPresent() && anySubstituteArticleHasAvailability()) {
            return Color("InStockGreen")
        }
        return Color("OutOfStockRed")
    }

    private func substituteArticlesPresent() -> Bool {
        return article.substituteArticles?.count ?? 0 > 1
    }

    private func anySubstituteArticleHasAvailability() -> Bool {
        for substituteArticle in article.substituteArticles ?? [] {
            if (substituteArticle.availability ?? 0 > 0) {
                return true
            }
        }
        return false
    }
}

struct ArticleListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListEntry(article: Article(articleNumber: "12345",
                                          articleDescription: "Test Description 1234",
                                          listPrice: 12.33,
                                          availability: 122,
                                          substituteArticles: [
                                            SubstituteArticle(articleNumber: "1234", availability: 1234),
                                            SubstituteArticle(articleNumber: "3453", availability: 2412)
                                          ]), selectedArticle: .constant("12345"))
    }
}
