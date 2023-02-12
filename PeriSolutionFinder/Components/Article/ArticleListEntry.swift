//
//  ArticleListEntry.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 11.02.23.
//

import SwiftUI

struct ArticleListEntry: View {
    let article: Article
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Group {
                    Text(article.articleNumber)
                        .text()
                        .padding([.leading, .trailing], 5)
                        .frame(width: UIScreen.main.bounds.width*0.2, alignment: .center)
                        .foregroundColor(.white)
                    Divider()
                    Text(article.articleDescription)
                        .text()
                        .padding([.leading, .trailing], 5)
                        .frame(width: UIScreen.main.bounds.width*0.25, alignment: .center)
                    Divider()
                }

                Group {
                    Text(article.listPrice?.description ?? "-")
                        .text()
                        .padding([.leading, .trailing], 5)
                        .frame(width: UIScreen.main.bounds.width*0.15, alignment: .center)
                    Divider()
                    HStack(spacing: 0) {
                        Text(article.availability?.description ?? "-")
                            .text()
                            .padding([.leading, .trailing], 5)
                        Image(systemName: "circle.fill")
                            .font(.system(size: 10))
                            .foregroundColor(getAvailabilityColor(availability: article.availability ?? 0))
                    }
                    .frame(width: UIScreen.main.bounds.width*0.2, alignment: .center)

                }
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
}

struct ArticleListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListEntry(article: Article(articleNumber: "12345",
                                          articleDescription: "Test Description 1234",
                                          listPrice: 12.33,
                                          availability: 122))
    }
}
