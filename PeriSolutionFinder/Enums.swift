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
    case Segment
    case Solution
}

enum Structure: String {
    case Wall
    case Column
    case Slab
    case Culvert
    case Tank
}

enum Product: String {
    case Duo
}

enum Segment: String {
    case Residential
    case NonResidential = "Non-Residential"
    case Infrastrucutre
    case Industrial
}
