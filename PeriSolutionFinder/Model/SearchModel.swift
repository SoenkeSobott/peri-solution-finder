//
//  SearchModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 29.12.22.
//

import SwiftUI

class SearchModel: ObservableObject {
    let identifier = UUID()

    @Published var searchTerm: String = ""

    @Published var selectedCriteria: SearchCriteria = SearchCriteria.Product

    // Product
    @Published private var selectedProduct: Product?

    // Structure
    @Published var structureElements: [Structure] = Structure.allCases
    @Published var selectedStructure: Structure = Structure.Wall

    // Structure - Wall
    @Published var wallThicknessLowValue: CGFloat = 0
    @Published var wallThicknessHighValue: CGFloat = 500
    @Published var wallHeightLowValue: CGFloat = 0
    @Published var wallHeightHighValue: CGFloat = 1000

    // Structure - Column
    @Published var columnThicknessLowValue: CGFloat = 0
    @Published var columnThicknessHighValue: CGFloat = 500
    @Published var columnHeightLowValue: CGFloat = 0
    @Published var columnHeightHighValue: CGFloat = 1000

    // Segment
    @Published var segmentElements: [Segment] = Segment.allCases
    @Published var selectedSegment: Segment = .Infrastructure
    @Published var infrastructureElements: [Infrastructure] = Infrastructure.allCases
    @Published var selectedInfrastructureElements: [Infrastructure] = []
    @Published var selectedInfrastructure: Infrastructure?

    // Segment - Tunnels
    @Published var tunnelElements: [Tunnel] = Tunnel.allCases
    @Published var selectedTunnelElements: [Tunnel] = []
    // Segment - Water Plants
    @Published var waterPlantElements: [WaterPlant] = WaterPlant.allCases
    @Published var selectedWaterPlantElements: [WaterPlant] = []


    // Solution
    @Published var solutionTags: [SolutionTag] = SolutionTag.allCases
    @Published var selectedSolutionTags: [SolutionTag] = []

    func getSelectedProduct() -> Product? {
        return selectedProduct
    }

    func setSelectedProduct(product: Product?) {
        self.selectedProduct = product
    }

    // Reset criteria filters

    func resetAllFilters() {
        searchTerm = ""
        setSelectedProduct(product: nil)
        resetStructureFilters()
        resetSegmentFilters()
        selectedSolutionTags = []
    }

    private func resetStructureFilters() {
        wallThicknessLowValue = 0
        wallThicknessHighValue = 500
        wallHeightLowValue = 0
        wallHeightHighValue = 1000

        columnThicknessLowValue = 0
        columnThicknessHighValue = 500
        columnHeightLowValue = 0
        columnHeightHighValue = 1000
    }

    private func resetSegmentFilters() {
        switch selectedSegment {
        case .Infrastructure:
            selectedInfrastructureElements = []
        default:
            SharedLogger.shared().info("Nothing to reset in segment")
        }
    }

    func hasSelectedItems() -> Bool {
        return (isProductFilterSet() || isStructureFilterSet() || isSegmentFilterSet() || isSolutionFilterSet())
    }

    // Filter set helper functions

    func isProductFilterSet() -> Bool {
        return selectedProduct != nil
    }

    func isStructureFilterSet() -> Bool {
        return isWallFilterSet() || isColumnFilterSet()
    }

    func isWallFilterSet() -> Bool {
        if (wallThicknessLowValue != 0) {
            return wallThicknessLowValue > 0
        }
        if (wallThicknessHighValue != 500) {
            return wallThicknessHighValue < 500
        }
        if (wallHeightLowValue != 0) {
            return wallHeightLowValue > 0
        }
        if (wallHeightHighValue != 1000) {
            return wallHeightHighValue < 1000
        }
        return false
    }

    func isColumnFilterSet() -> Bool {
        if (columnThicknessLowValue != 0) {
            return columnThicknessLowValue > 0
        }
        if (columnThicknessHighValue != 500) {
            return columnThicknessHighValue < 500
        }
        if (columnHeightLowValue != 0) {
            return columnHeightLowValue > 0
        }
        if (columnHeightHighValue != 1000) {
            return columnHeightHighValue < 1000
        }
        return false
    }

    func isSegmentFilterSet() -> Bool {
        return isInfrastructureFilterSet()
    }

    private func isInfrastructureFilterSet() -> Bool {
        return selectedInfrastructureElements.count > 0
    }

    func isSolutionFilterSet() -> Bool {
        return selectedSolutionTags.count > 0
    }
}
