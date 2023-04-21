//
//  Article.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import Foundation

struct Article: Decodable, Hashable {
    var articleNumber: String
    var articleDescription: String?
    var listPrice: Float?
    var availability: Int?
    var substituteArticles: [SubstituteArticle]?
}

struct SubstituteArticle: Decodable, Hashable {
    var articleNumber: String
    var availability: Int?
}
