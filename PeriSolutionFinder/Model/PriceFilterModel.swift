//
//  PriceFilterModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 14.02.23.
//

import Foundation

class PriceFilterModel: ObservableObject {
    @Published var startValue: Float = 0
    @Published var median: Float = 0
    @Published var endValue: Float = 100

    func setStartValue(projects: [Project]) {
        if (projects.count > 0) {
            let sorted = projects.compactMap { $0.projectPricePerUnit }.sorted()
            self.startValue = sorted.first ?? 0
        }
    }

    func setEndValue(projects: [Project]) {
        if (projects.count > 0) {
            let sorted = projects.compactMap { $0.projectPricePerUnit }.sorted()
            self.endValue = sorted.last ?? 1
        }
    }

    func setMedian(projects: [Project]) {
        var median: Float = 0.0
        if (projects.count > 0) {
            let sorted = projects.compactMap { $0.projectPricePerUnit }.sorted()
            if (sorted.count > 0) {
                if sorted.count % 2 == 0 {
                    median = Float((sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1])) / 2
                } else {
                    median = Float(sorted[(sorted.count - 1) / 2])
                }
            }
        }
        self.median = median
    }

}

