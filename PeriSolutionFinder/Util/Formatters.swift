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
    var unit = "m2"
    if (product == "PS100") {
        unit = "m3"
    }

    // Price
    var formattedPrice = "-"
    let price = project.projectPrice
    if (price != nil) {
        var pricePerUnit: Float = 0.0
        if (unit.elementsEqual("m3")) {
            if let m3OfShoring = project.m3OfShoring {
                pricePerUnit = price!/m3OfShoring
            }
        } else {
            if let m2OfFormwork = project.m2OfFormwork {
                pricePerUnit = price!/m2OfFormwork
            }
        }
        formattedPrice = "$ " + formatter.string(from: pricePerUnit as NSNumber)! + "/" +  getUnitString(unit: unit)
    }
    return formattedPrice
}

func getUnitString(unit: String) -> String {
    return unit.elementsEqual("m2") ? UnitArea.squareMeters.symbol : UnitVolume.cubicMeters.symbol
}

