//
//  SearchModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 29.12.22.
//

import SwiftUI

class SearchModel: ObservableObject {
    let identifier = UUID()

    @Published var selectedCriteria: SearchCriteria = SearchCriteria.Product

    // Product
    @Published private var selectedProduct: Product?

    // Structure
    @Published var structureElements: [Structure] = [Structure.Wall, Structure.Column, Structure.Slab, Structure.Culvert, Structure.Tank]
    @Published var selectedStructure: Structure = Structure.Wall

    // Structure - Wall
    @Published var wallThicknessLowValue: CGFloat = 0
    @Published var wallThicknessHighValue: CGFloat = 500
    @Published var wallHeightLowValue: CGFloat = 0
    @Published var wallHeightHighValue: CGFloat = 1000

    // Structure - Column
    @Published var columnThicknessLowValue: CGFloat = 0
    @Published var columnThicknessHighValue: CGFloat = 100
    @Published var columnHeightLowValue: CGFloat = 0
    @Published var columnHeightHighValue: CGFloat = 1000

    // Segment
    @Published var segmentElements: [Segment] = [Segment.Residential, Segment.NonResidential, Segment.Infrastrucutre, Segment.Industrial]
    @Published var selectedSegment: Segment = Segment.Infrastrucutre
    @Published var infrastructureElements: [Infrastructure] = [Infrastructure.Bridges, Infrastructure.Tunnels, Infrastructure.LandTraffics, Infrastructure.Airports, Infrastructure.MarineAndWaterInfrastructur, Infrastructure.WaterPlants]
    @Published var selectedInfrastructureElements: [Infrastructure] = []
    @Published var selectedInfrastructure: Infrastructure?

    // Segment - Tunnels
    @Published var tunnelElements: [Tunnel] = [Tunnel.RoadTunnels, Tunnel.RailwayTunnels, Tunnel.NonTrafficTunnels]
    @Published var selectedTunnelElements: [Tunnel] = []
    // Segment - Water Plants
    @Published var waterPlantElements: [WaterPlant] = [WaterPlant.WaterTreatmentPlants, WaterPlant.DesalinationPlants, WaterPlant.ElevatedWaterTowers]
    @Published var selectedWaterPlantElements: [WaterPlant] = []


    // Solution
    @Published var solutionElements: [Solution] = [Solution.ChamferCorner, Solution.StraightWall, Solution.Traveller]
    @Published var selectedSolutionElements: [Solution] = []



    // FilterValues
    @Published private var searchTerm: String = ""


    func getSearchTerm() -> String {
        return searchTerm
    }

    func setSearchTerm(searchTerm: String) {
        self.searchTerm = searchTerm
    }

    func getSelectedProduct() -> Product? {
        return selectedProduct
    }

    func setSelectedProduct(product: Product?) {
        self.selectedProduct = product
    }

    // Reset criteria filters

    func resetSelectedCriteriaFilters() {
        switch selectedCriteria {
        case .Product:
            setSelectedProduct(product: nil)
        case .Structure:
            resetStructureFilters()
        case .Segment:
            resetSegmentFilters()
        case .Solution:
            selectedSolutionElements = []
        }
    }

    private func resetStructureFilters() {
        wallThicknessLowValue = 0
        wallThicknessHighValue = 500
        wallHeightLowValue = 0
        wallHeightHighValue = 1000

        columnThicknessLowValue = 0
        columnThicknessHighValue = 100
        columnHeightLowValue = 0
        columnHeightHighValue = 1000
    }

    private func resetSegmentFilters() {
        switch selectedSegment {
        case .Infrastrucutre:
            selectedInfrastructureElements = []
        default:
            SharedLogger.shared().info("Nothing to reset in segment")
        }
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
        if (columnThicknessHighValue != 100) {
            return columnThicknessHighValue < 100
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

    func isInfrastructureFilterSet() -> Bool {
        return selectedInfrastructureElements.count > 0
    }

    func isSolutionFilterSet() -> Bool {
        return selectedSolutionElements.count > 0
    }
}
