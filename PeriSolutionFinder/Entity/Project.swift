//
//  Project.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 16.12.22.
//

import Foundation

struct Project: Identifiable, Decodable, Hashable {
    static func == (lhs: Project, rhs: Project) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id: String
    var projectNumber : String
    var projectName: String
    var drawingNumber: String
    var drawingLink: String?
    var billOfQuantity: [BillOffQuantityEntry]?
    var pictures: [String]?
    var height: Float?
    var maxPourHeight: Float?
    var thickness: Float?
    var width: Float?
    var m2OfFormwork: Float?
    var m2OfConcrete: Float?
    var planViewSize: String?
    var location: String?
    var coordinates: String?
    var product: String?
    var mainStructure: String?
    var segmentLevelOne: String?
    var segmentLevelTwo: String?
    var segmentLevelThree: String?
    var solutionTags: [String]?
}

struct BillOffQuantityEntry: Identifiable, Decodable {
    var id: String {articleNumber ?? UUID().description}
    var articleNumber: String?
    var description: String?
    var unit: String?
    var quantity: Int?
    var weightPerUnit: Float?
}
