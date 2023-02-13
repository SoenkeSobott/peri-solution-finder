//
//  ProjectPrice.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 13.02.23.
//

import Foundation


struct ProjectPrice: Decodable {
    var price: Float
    var currency: String
    var unit: String
}
