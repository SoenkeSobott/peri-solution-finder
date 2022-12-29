//
//  Enums.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import Foundation

enum SearchCriteria {
    case Product
    case Structure
}

enum Structure: String {
    case Wall
    case Column
    case Slob
}

enum Product: String {
    case Duo
}
