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
    var thickness: Float?
    var planViewSize: String?
    var location: String?
    var product: String?
    var structure: String?
    var solutionOne: String?
    var solutionTwo: String?
    var solutionThree: String?
    var solutionFour: String?
}

struct BillOffQuantityEntry: Identifiable, Decodable {
    var id: String {articleNumber + description}
    var articleNumber: String
    var description: String
    var unit: String?
    var quantity: Float?
    var weightPerUnit: Float?
}
