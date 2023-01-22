//
//  Filter.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.01.23.
//

import Foundation

struct Filter: Identifiable, Encodable {
    var id = UUID()
    var searchTerm: String
    var product: String
    var wallFilter: ThicknessAndHeightFilter
    var columnFilter: LengthWidthAndHeightFilter
    var culvertFilter: ThicknessAndHeightFilter
    var infrastructureElements: [String]
    var industrialElements: [String]
    var residentialElements: [String]
    var nonResidentialElements: [String]
    var solutionTags: [String]?
}

struct ThicknessAndHeightFilter: Identifiable, Encodable {
    var id = UUID()
    var minThickness: CGFloat?
    var maxThickness: CGFloat?
    var minHeight: CGFloat?
    var maxHeight: CGFloat?
}

struct LengthWidthAndHeightFilter: Identifiable, Encodable {
    var id = UUID()
    var minLength: CGFloat?
    var maxLength: CGFloat?
    var minWidth: CGFloat?
    var maxWidth: CGFloat?
    var minHeight: CGFloat?
    var maxHeight: CGFloat?
}
