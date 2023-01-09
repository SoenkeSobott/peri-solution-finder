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

    // Element
    @Published var structureElements: [Structure] = [Structure.Wall, Structure.Column, Structure.Slab, Structure.Culvert, Structure.Tank]
    @Published var selectedStructure: Structure = Structure.Wall


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
    @Published var searchTerm: String = ""
    @Published private var thicknessLowValue: CGFloat?
    @Published private var thicknessHighValue: CGFloat?
    @Published private var heightLowValue: CGFloat?
    @Published private var heightHighValue: CGFloat?

    func getSelectedProduct() -> Product? {
        return selectedProduct
    }

    func setSelectedProduct(product: Product?) {
        self.selectedProduct = product
    }

    func getThicknessLowValue() -> CGFloat? {
        return thicknessLowValue
    }

    func setThicknessLowValue(thickness: CGFloat?) {
        self.thicknessLowValue = thickness
    }

    func getThicknessHighValue() -> CGFloat? {
        return thicknessHighValue
    }

    func setThicknessHighValue(thickness: CGFloat?) {
        self.thicknessHighValue = thickness
    }

    func getHeightLowValue() -> CGFloat? {
        return heightLowValue
    }

    func setHeightLowValue(height: CGFloat?) {
        self.heightLowValue = height
    }

    func getHeightHighValue() -> CGFloat? {
        return heightHighValue
    }

    func setHeightHighValue(height: CGFloat?) {
        self.heightHighValue = height
    }

    // Filter set helper functions

    func isProductFilterSet() -> Bool {
        return selectedProduct != nil
    }

    func isStructureFilterSet() -> Bool {
        return isWallFilterSet()
    }

    func isWallFilterSet() -> Bool {
        if (thicknessLowValue != nil && thicknessLowValue! != 0) {
            return thicknessLowValue! > 0
        }
        if (thicknessHighValue != nil && thicknessHighValue! != 100) {
            return thicknessHighValue! < 100
        }
        if (heightLowValue != nil && heightLowValue != 0) {
            return heightLowValue! > 0
        }
        if (heightHighValue != nil && heightHighValue != 1000) {
            return heightHighValue! < 1000
        }
        return false
    }

    func isSegmentFilterSet() -> Bool {
        return isInfrastructureFilterSet()
    }

    func isInfrastructureFilterSet() -> Bool {
        return selectedInfrastructureElements.count > 0
    }
}
