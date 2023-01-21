//
//  swift
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
    @Published var wallThicknessLowValue: CGFloat? = nil
    @Published var wallThicknessHighValue: CGFloat? = nil
    @Published var wallHeightLowValue: CGFloat? = nil
    @Published var wallHeightHighValue: CGFloat? = nil

    // Structure - Column
    @Published var columnLengthLowValue: CGFloat? = nil
    @Published var columnLengthHighValue: CGFloat? = nil
    @Published var columnWidthLowValue: CGFloat? = nil
    @Published var columnWidthHighValue: CGFloat? = nil
    @Published var columnHeightLowValue: CGFloat? = nil
    @Published var columnHeightHighValue: CGFloat? = nil

    // Structure - Culvert
    @Published var culvertThicknessLowValue: CGFloat? = nil
    @Published var culvertThicknessHighValue: CGFloat? = nil
    @Published var culvertHeightLowValue: CGFloat? = nil
    @Published var culvertHeightHighValue: CGFloat? = nil

    // Segment
    @Published var segmentElements: [Segment] = Segment.allCases
    @Published var selectedSegment: Segment = .Infrastructure
    @Published var infrastructureElements: [Infrastructure] = Infrastructure.allCases
    @Published var selectedInfrastructureElements: [Infrastructure] = []
    @Published var industrialElements: [Industrial] = Industrial.allCases
    @Published var selectedIndustrialElements: [Industrial] = []
    @Published var residentialElements: [Residential] = Residential.allCases
    @Published var selectedResidentialElements: [Residential] = []

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

    // Segment

    func executeSegmentFilterAction(element: String) {
        switch selectedSegment {
        case .Residential:
            guard let residential = Residential(rawValue: element) else {
                SharedLogger.shared().error("Invalid Residential enum case \(element)")
                return
            }
            if (selectedResidentialElements.contains(residential)) {
                selectedResidentialElements.removeAll { $0 == residential }
            } else {
                selectedResidentialElements.append(residential)
            }
        case .NonResidential:
            print("NonResidential")
        case .Infrastructure:
            guard let infrastructure = Infrastructure(rawValue: element) else {
                SharedLogger.shared().error("Invalid Infrastructure enum case \(element)")
                return
            }
            if (selectedInfrastructureElements.contains(infrastructure)) {
                selectedInfrastructureElements.removeAll { $0 == infrastructure }
            } else {
                selectedInfrastructureElements.append(infrastructure)
            }
        case .Industrial:
            guard let industrial = Industrial(rawValue: element) else {
                SharedLogger.shared().error("Invalid Industrial enum case \(element)")
                return
            }
            if (selectedIndustrialElements.contains(industrial)) {
                selectedIndustrialElements.removeAll { $0 == industrial }
            } else {
                selectedIndustrialElements.append(industrial)
            }
        }
    }

    func isSegmentFilterSelected(element: String) -> Bool {
        switch selectedSegment {
        case .Residential:
            guard let residential = Residential(rawValue: element) else {
                SharedLogger.shared().error("Invalid Residential enum case \(element)")
                return false
            }
            return selectedResidentialElements.contains(residential)
        case .NonResidential:
            return false
        case .Infrastructure:
            guard let infrastructure = Infrastructure(rawValue: element) else {
                SharedLogger.shared().error("Invalid Infrastructure enum case \(element)")
                return false
            }
            return selectedInfrastructureElements.contains(infrastructure)
        case .Industrial:
            guard let industrial = Industrial(rawValue: element) else {
                SharedLogger.shared().error("Invalid Industrial enum case \(element)")
                return false
            }
            return selectedIndustrialElements.contains(industrial)
        }
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
        wallThicknessLowValue = nil
        wallThicknessHighValue = nil
        wallHeightLowValue = nil
        wallHeightHighValue = nil

        columnLengthLowValue = nil
        columnLengthHighValue = nil
        columnWidthLowValue = nil
        columnWidthHighValue = nil
        columnHeightLowValue = nil
        columnHeightHighValue = nil

        culvertThicknessLowValue = nil
        culvertThicknessHighValue = nil
        culvertHeightLowValue = nil
        culvertHeightHighValue = nil
    }

    private func resetSegmentFilters() {
        selectedInfrastructureElements = []
        selectedIndustrialElements = []
        selectedResidentialElements = []
    }

    func hasSelectedItems() -> Bool {
        return (isProductFilterSet() || isStructureFilterSet() || isSegmentFilterSet() || isSolutionFilterSet())
    }

    // Filter set helper functions

    func isProductFilterSet() -> Bool {
        return selectedProduct != nil
    }

    func isStructureFilterSet() -> Bool {
        return isWallFilterSet() || isColumnFilterSet() || isCulvertFilterSet()
    }

    func isWallFilterSet() -> Bool {
        return (wallThicknessLowValue != nil || wallThicknessHighValue != nil || wallHeightLowValue != nil || wallHeightHighValue != nil)
    }

    func isColumnFilterSet() -> Bool {
        return (columnLengthLowValue != nil || columnLengthHighValue != nil || columnWidthLowValue != nil || columnWidthHighValue != nil ||
                columnHeightLowValue != nil || columnHeightHighValue != nil)
    }

    func isCulvertFilterSet() -> Bool {
        return (culvertThicknessLowValue != nil || culvertThicknessHighValue != nil || culvertHeightLowValue != nil || culvertHeightHighValue != nil)
    }

    func isSegmentFilterSet() -> Bool {
        return (isInfrastructureFilterSet() || isIndustrialFilterSet() || isResidentialFilterSet())
    }

    private func isInfrastructureFilterSet() -> Bool {
        return selectedInfrastructureElements.count > 0
    }

    private func isIndustrialFilterSet() -> Bool {
        return selectedIndustrialElements.count > 0
    }

    private func isResidentialFilterSet() -> Bool {
        return selectedResidentialElements.count > 0
    }

    func isSolutionFilterSet() -> Bool {
        return selectedSolutionTags.count > 0
    }

    func createSearchFilterObject() -> Filter {
        let wallFilter = ThicknessAndHeightFilter(minThickness: wallThicknessLowValue,
                                                  maxThickness: wallThicknessHighValue,
                                                  minHeight: wallHeightLowValue,
                                                  maxHeight: wallHeightHighValue)

        let columnFilter = LengthWidthAndHeightFilter(minLength: columnLengthLowValue,
                                                      maxLength: columnLengthHighValue,
                                                      minWidth: columnWidthLowValue,
                                                      maxWidth: columnWidthHighValue,
                                                      minHeight: columnHeightLowValue,
                                                      maxHeight: columnHeightHighValue)

        let culvertFilter = ThicknessAndHeightFilter(minThickness: culvertThicknessLowValue,
                                                     maxThickness: culvertThicknessHighValue,
                                                     minHeight: culvertHeightLowValue,
                                                     maxHeight: culvertHeightHighValue)

        return Filter(searchTerm: searchTerm,
                      product: getSelectedProduct()?.rawValue ?? "",
                      wallFilter: wallFilter,
                      columnFilter: columnFilter,
                      culvertFilter: culvertFilter,
                      infrastructureElements: selectedInfrastructureElements.map { $0.rawValue },
                      industrialElements: selectedIndustrialElements.map{ $0.rawValue },
                      residentialElements: selectedResidentialElements.map{ $0.rawValue },
                      solutionTags: selectedSolutionTags.map { $0.rawValue })
    }
    
}
