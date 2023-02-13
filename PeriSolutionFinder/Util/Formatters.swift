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
