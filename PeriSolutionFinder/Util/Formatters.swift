//
//  Formatters.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 13.02.23.
//

import Foundation

func formatNumber(number: Float?) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 0;
    if (number != nil) {
        return formatter.string(from: number! as NSNumber) ?? "-"
    }
    return "-"
}

func formatPrice(project: Project) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 0

    // Unit
    let product = project.product
    var unit = UnitArea.squareMeters.symbol
    if (product == "PS100") {
        unit = UnitVolume.cubicMeters.symbol
    }

    // Price
    var formattedPrice = "$ 0/"+unit
    let projectPricePerUnit = project.projectPricePerUnit
    if (projectPricePerUnit != nil) {
        formattedPrice = "$ " + formatter.string(from: projectPricePerUnit! as NSNumber)! + "/" +  unit
    }
    return formattedPrice
}

