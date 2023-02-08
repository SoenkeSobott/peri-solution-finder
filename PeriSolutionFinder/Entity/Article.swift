//
//  Article.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import Foundation

struct Article: Decodable {
    var articleNumber: String
    var articleDescription: String
    var listPrice: Float
    var availability: Int
}
