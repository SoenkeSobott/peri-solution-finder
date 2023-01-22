//
//  SearchModelTest.swift
//  PeriSolutionFinderTests
//
//  Created by Sönke Sobott on 18.01.23.
//

import XCTest
@testable import PeriSolutionFinder

final class SearchModelTest: XCTestCase {

    let searchModel = SearchModel()

    override func setUp() {
        searchModel.resetAllFilters()
     }

    func testDefaultSearchTermValue() {
        XCTAssertEqual(searchModel.searchTerm, "", "Incorrect Default searchTerm")
    }

    func testDefaultProductValue() {
        XCTAssertEqual(searchModel.getSelectedProduct(), nil, "Incorrect default selectedProduct")
    }

    func testDefaultStructureValues() {
        XCTAssertEqual(searchModel.structureElements, [.Wall, .Column, .Slab, .Culvert], "Incorrect default structureElements")
        XCTAssertEqual(searchModel.selectedStructure, .Wall, "Incorrect Default selectedStructure")
    }

    func testDefaultWallValues() {
        XCTAssertEqual(searchModel.wallThicknessLowValue, nil, "Incorrect Default wallThicknessLowValue")
        XCTAssertEqual(searchModel.wallThicknessHighValue, nil, "Incorrect Default wallThicknessHighValue")
        XCTAssertEqual(searchModel.wallHeightLowValue, nil, "Incorrect Default wallHeightLowValue")
        XCTAssertEqual(searchModel.wallHeightHighValue, nil, "Incorrect Default wallHeightHighValue")
    }

    func testDefaultColumnValues() {
        XCTAssertEqual(searchModel.columnLengthLowValue, nil, "Incorrect Default columnLengthLowValue")
        XCTAssertEqual(searchModel.columnLengthHighValue, nil, "Incorrect Default columnLengthHighValue")
        XCTAssertEqual(searchModel.columnWidthLowValue, nil, "Incorrect Default columnWidthLowValue")
        XCTAssertEqual(searchModel.columnWidthHighValue, nil, "Incorrect Default columnWidthHighValue")
        XCTAssertEqual(searchModel.columnHeightLowValue, nil, "Incorrect Default columnHeightLowValue")
        XCTAssertEqual(searchModel.columnHeightHighValue, nil, "Incorrect Default columnHeightHighValue")
    }

    func testDefaultCulvertValues() {
        XCTAssertEqual(searchModel.culvertThicknessLowValue, nil, "Incorrect Default culvertThicknessLowValue")
        XCTAssertEqual(searchModel.culvertThicknessHighValue, nil, "Incorrect Default culvertThicknessHighValue")
        XCTAssertEqual(searchModel.culvertHeightLowValue, nil, "Incorrect Default culvertHeightLowValue")
        XCTAssertEqual(searchModel.culvertHeightHighValue, nil, "Incorrect Default culvertHeightHighValue")
    }

    func testDefaultSegmentValues() {
        XCTAssertEqual(searchModel.segmentElements, [.Infrastructure, .Industrial, .NonResidential, .Residential], "Incorrect Default segmentElements")
        XCTAssertEqual(searchModel.selectedSegment, .Infrastructure, "Incorrect Default selectedSegment")
    }

    func testDefaultInfrastructureValues() {
        XCTAssertEqual(searchModel.infrastructureElements, [.Bridges, .Tunnels, .LandTraffic, .Airports, .MarineAndWaterInfrastructur, .WaterPlants], "Incorrect Default infrastructureElements")
        XCTAssertEqual(searchModel.selectedInfrastructureElements, [], "Incorrect Default selectedInfrastructureElements")
    }

    func testDefaultIndustrialValues() {
        XCTAssertEqual(searchModel.industrialElements, [.OilAndGas, .Chemicals, .Power, .MetalsAndMinerals, .IndustrializedManufacturing], "Incorrect Default industrialElements")
        XCTAssertEqual(searchModel.selectedIndustrialElements, [], "Incorrect Default selectedIndustrialElements")
    }

    func testDefaultResidentialValues() {
        XCTAssertEqual(searchModel.residentialElements, [.MultiFamilyHousingAboveTenFloors, .MultiFamilyHousingUpToTenFloors, .SingleFamilyHousing], "Incorrect Default residentialElements")
        XCTAssertEqual(searchModel.selectedResidentialElements, [], "Incorrect Default residentialElements")
    }

    func testDefaultNonResidentialValues() {
        XCTAssertEqual(searchModel.nonResidentialElements, [.OfficeBuildings, .RetailBuildings, .LeisureAndHospitalityBuildings, .CulturalAndInstitutionalBuildings, .HealthcareBuildings, .TransportationAndLogisticsBuildings], "Incorrect Default nonResidentialElements")
        XCTAssertEqual(searchModel.selectedNonResidentialElements, [], "Incorrect Default selectedNonResidentialElements")
    }

    func testDefaultTunnelValues() {
        XCTAssertEqual(searchModel.tunnelElements, [.RoadTunnels, .RailwayTunnels, .NonTrafficTunnels], "Incorrect Default tunnelElements")
        XCTAssertEqual(searchModel.selectedTunnelElements, [], "Incorrect Default selectedTunnelElements")
    }

    func testDefaultWaterPlantsValues() {
        XCTAssertEqual(searchModel.waterPlantElements, [.WaterTreatmentPlants, .ElevatedWaterTowers, .DesalinationPlants], "Incorrect Default waterPlantElements")
        XCTAssertEqual(searchModel.selectedWaterPlantElements, [], "Incorrect Default selectedWaterPlantElements")
    }

    func testDefaultSolutionTagValues() {
        XCTAssertEqual(searchModel.selectedSolutionTags, [], "Incorrect Default selectedSolutionTags")
    }

    func testResetAllFilters() {
        searchModel.searchTerm = "GRODT"
        searchModel.setSelectedProduct(product: .Duo)

        searchModel.wallThicknessLowValue = 50
        searchModel.wallThicknessHighValue = 200
        searchModel.wallHeightLowValue = 100
        searchModel.wallHeightHighValue = 760

        searchModel.columnLengthLowValue = 23
        searchModel.columnLengthHighValue = 353
        searchModel.columnWidthLowValue = 23
        searchModel.columnWidthHighValue = 200
        searchModel.columnHeightLowValue = 89
        searchModel.columnHeightHighValue = 888

        searchModel.culvertThicknessLowValue = 34
        searchModel.culvertThicknessHighValue = 200
        searchModel.culvertHeightLowValue = 100
        searchModel.culvertHeightHighValue = 760

        searchModel.selectedInfrastructureElements = [.WaterPlants, .Airports, .Tunnels]
        searchModel.selectedIndustrialElements = [.Power, .IndustrializedManufacturing]
        searchModel.selectedResidentialElements = [.SingleFamilyHousing]
        searchModel.selectedNonResidentialElements = [.HealthcareBuildings, .LeisureAndHospitalityBuildings]
        searchModel.selectedSolutionTags = [.Tank, .ChamferCorner, .ConcreteShoringBeam, .Basement]

        searchModel.resetAllFilters()

        XCTAssertEqual(searchModel.searchTerm, "", "Incorrect Default searchTerm")
        XCTAssertEqual(searchModel.getSelectedProduct(), nil, "Incorrect default selectedProduct")

        XCTAssertEqual(searchModel.wallThicknessLowValue, nil, "Incorrect Default wallThicknessLowValue")
        XCTAssertEqual(searchModel.wallThicknessHighValue, nil, "Incorrect Default wallThicknessHighValue")
        XCTAssertEqual(searchModel.wallHeightLowValue, nil, "Incorrect Default wallHeightLowValue")
        XCTAssertEqual(searchModel.wallHeightHighValue, nil, "Incorrect Default wallHeightHighValue")

        XCTAssertEqual(searchModel.columnLengthLowValue, nil, "Incorrect Default columnLengthLowValue")
        XCTAssertEqual(searchModel.columnLengthHighValue, nil, "Incorrect Default columnLengthHighValue")
        XCTAssertEqual(searchModel.columnWidthLowValue, nil, "Incorrect Default columnWidthLowValue")
        XCTAssertEqual(searchModel.columnWidthHighValue, nil, "Incorrect Default columnWidthHighValue")
        XCTAssertEqual(searchModel.columnHeightLowValue, nil, "Incorrect Default columnHeightLowValue")
        XCTAssertEqual(searchModel.columnHeightHighValue, nil, "Incorrect Default columnHeightHighValue")

        XCTAssertEqual(searchModel.culvertThicknessLowValue, nil, "Incorrect Default culvertThicknessLowValue")
        XCTAssertEqual(searchModel.culvertThicknessHighValue, nil, "Incorrect Default culvertThicknessHighValue")
        XCTAssertEqual(searchModel.culvertHeightLowValue, nil, "Incorrect Default culvertHeightLowValue")
        XCTAssertEqual(searchModel.culvertHeightHighValue, nil, "Incorrect Default culvertHeightHighValue")

        XCTAssertEqual(searchModel.selectedInfrastructureElements, [], "Incorrect Default selectedInfrastructureElements")
        XCTAssertEqual(searchModel.selectedIndustrialElements, [], "Incorrect Default selectedIndustrialElements")
        XCTAssertEqual(searchModel.selectedResidentialElements, [], "Incorrect Default selectedResidentialElements")
        XCTAssertEqual(searchModel.selectedNonResidentialElements, [], "Incorrect Default selectedNonResidentialElements")
        XCTAssertEqual(searchModel.selectedSolutionTags, [], "Incorrect Default selectedSolutionTags")
    }

    func testHasSelectedItemsWhenOnlyProductIsSet() {
        XCTAssertFalse(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")

        searchModel.setSelectedProduct(product: .Duo)
        XCTAssertTrue(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")
    }

    func testHasSelectedItemsWhenOnlyStructureIsSet() {
        XCTAssertFalse(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")

        searchModel.wallHeightLowValue = 100
        searchModel.wallThicknessLowValue = 30
        XCTAssertTrue(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")
    }

    func testHasSelectedItemsWhenOnlySegmentIsSet() {
        XCTAssertFalse(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")

        searchModel.selectedInfrastructureElements = [.Tunnels, .MarineAndWaterInfrastructur]
        XCTAssertTrue(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")
    }

    func testHasSelectedItemsWhenOnlySolutionIsSet() {
        XCTAssertFalse(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")

        searchModel.selectedSolutionTags = [.Tank, .ConcreteShoringBeam, .Basement]
        XCTAssertTrue(searchModel.hasSelectedItems(), "Incorrect value for hasSelectedItems()")
    }

    func testIsProductFilterSet() {
        XCTAssertFalse(searchModel.isProductFilterSet(), "Incorrect value for isProductFilterSet()")

        searchModel.setSelectedProduct(product: .Duo)
        XCTAssertTrue(searchModel.isProductFilterSet(), "Incorrect value for isProductFilterSet()")
    }

    func testIsStructureFilterSetWhenOnlyWallIsSet() {
        XCTAssertFalse(searchModel.isStructureFilterSet(), "Incorrect value for isStructureFilterSet()")

        searchModel.wallHeightLowValue = 10
        searchModel.wallThicknessHighValue = 200
        XCTAssertTrue(searchModel.isStructureFilterSet(), "Incorrect value for isStructureFilterSet()")
    }

    func testIsStructureFilterSetWhenOnlyColumnIsSet() {
        XCTAssertFalse(searchModel.isStructureFilterSet(), "Incorrect value for isStructureFilterSet()")

        searchModel.columnHeightLowValue = 10
        searchModel.columnLengthLowValue = 200
        XCTAssertTrue(searchModel.isStructureFilterSet(), "Incorrect value for isStructureFilterSet()")
    }

    func testIsStructureFilterSetWhenOnlyCulvertIsSet() {
        XCTAssertFalse(searchModel.isStructureFilterSet(), "Incorrect value for isStructureFilterSet()")

        searchModel.culvertHeightLowValue = 10
        searchModel.culvertThicknessLowValue = 200
        XCTAssertTrue(searchModel.isStructureFilterSet(), "Incorrect value for isStructureFilterSet()")
    }

    // Wall

    func testIsWallFilterSetWhenOnlyThicknessLowValueSet() {
        XCTAssertFalse(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")

        searchModel.wallThicknessLowValue = 1
        XCTAssertTrue(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")
    }

    func testIsWallFilterSetWhenOnlyThicknessHighValueSet() {
        XCTAssertFalse(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")

        searchModel.wallThicknessHighValue = 499
        XCTAssertTrue(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")
    }

    func testIsWallFilterSetWhenOnlyHeightLowValueSet() {
        XCTAssertFalse(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")

        searchModel.wallHeightLowValue = 1
        XCTAssertTrue(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")
    }

    func testIsWallFilterSetWhenOnlyHeightHighValueSet() {
        XCTAssertFalse(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")

        searchModel.wallHeightHighValue = 999
        XCTAssertTrue(searchModel.isWallFilterSet(), "Incorrect value for isWallFilterSet()")
    }

    // Column

    func testIsColumnFilterSetWhenOnlyLengthLowValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnLengthLowValue = 1
        XCTAssertTrue(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")
    }

    func testIsColumnFilterSetWhenOnlyLengthHighValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnLengthHighValue = 499
        XCTAssertTrue(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")
    }

    func testIsColumnFilterSetWhenOnlyWidthLowValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnWidthLowValue = 1
        XCTAssertTrue(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")
    }

    func testIsColumnFilterSetWhenOnlyWidthHighValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnWidthHighValue = 499
        XCTAssertTrue(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")
    }

    func testIsColumnFilterSetWhenOnlyHeightLowValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnHeightLowValue = 1
        XCTAssertTrue(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")
    }

    func testIsColumnFilterSetWhenOnlyHeightHighValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnHeightHighValue = 999
        XCTAssertTrue(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")
    }

    // Culvert

    func testIsCulvertFilterSetWhenOnlyThicknessLowValueSet() {
        XCTAssertFalse(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")

        searchModel.culvertThicknessLowValue = 1
        XCTAssertTrue(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")
    }

    func testIsCulvertFilterSetWhenOnlyThicknessHighValueSet() {
        XCTAssertFalse(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")

        searchModel.culvertThicknessHighValue = 499
        XCTAssertTrue(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")
    }

    func testIsCulvertFilterSetWhenOnlyHeightLowValueSet() {
        XCTAssertFalse(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")

        searchModel.culvertHeightLowValue = 1
        XCTAssertTrue(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")
    }

    func testIsCulvertFilterSetWhenOnlyHeightHighValueSet() {
        XCTAssertFalse(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")

        searchModel.culvertHeightHighValue = 999
        XCTAssertTrue(searchModel.isCulvertFilterSet(), "Incorrect value for isCulvertFilterSet()")
    }

    // Segment

    func testExecuteSegementFilterActionAndIsSegmentFilterSelectedForInfrastructure() {
        searchModel.selectedSegment = .Infrastructure
        searchModel.executeSegmentFilterAction(element: Infrastructure.LandTraffic.rawValue)
        XCTAssertEqual(searchModel.selectedInfrastructureElements, [.LandTraffic])
        XCTAssertTrue(searchModel.isSegmentFilterSelected(element: Infrastructure.LandTraffic.rawValue))

        searchModel.executeSegmentFilterAction(element: Infrastructure.LandTraffic.rawValue)
        XCTAssertEqual(searchModel.selectedInfrastructureElements, [])
        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: Infrastructure.LandTraffic.rawValue))

        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: "NotValidValue"))
        searchModel.executeSegmentFilterAction(element: "NotValidValue")
    }

    func testExecuteSegementFilterActionAndIsSegmentFilterSelectedForIndustrial() {
        searchModel.selectedSegment = .Industrial
        searchModel.executeSegmentFilterAction(element: Industrial.OilAndGas.rawValue)
        XCTAssertEqual(searchModel.selectedIndustrialElements, [.OilAndGas])
        XCTAssertTrue(searchModel.isSegmentFilterSelected(element: Industrial.OilAndGas.rawValue))

        searchModel.executeSegmentFilterAction(element: Industrial.OilAndGas.rawValue)
        XCTAssertEqual(searchModel.selectedIndustrialElements, [])
        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: Industrial.OilAndGas.rawValue))

        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: "NotValidValue"))
        searchModel.executeSegmentFilterAction(element: "NotValidValue")
    }

    func testExecuteSegementFilterActionForResidential() {
        searchModel.selectedSegment = .Residential
        searchModel.executeSegmentFilterAction(element: Residential.SingleFamilyHousing.rawValue)
        XCTAssertEqual(searchModel.selectedResidentialElements, [.SingleFamilyHousing])
        XCTAssertTrue(searchModel.isSegmentFilterSelected(element: Residential.SingleFamilyHousing.rawValue))

        searchModel.executeSegmentFilterAction(element: Residential.SingleFamilyHousing.rawValue)
        XCTAssertEqual(searchModel.selectedResidentialElements, [])
        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: Residential.SingleFamilyHousing.rawValue))

        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: "NotValidValue"))
        searchModel.executeSegmentFilterAction(element: "NotValidValue")
    }

    func testExecuteSegementFilterActionForNonResidential() {
        searchModel.selectedSegment = .NonResidential
        searchModel.executeSegmentFilterAction(element: NonResidential.CulturalAndInstitutionalBuildings.rawValue)
        XCTAssertEqual(searchModel.selectedNonResidentialElements, [.CulturalAndInstitutionalBuildings])
        XCTAssertTrue(searchModel.isSegmentFilterSelected(element: NonResidential.CulturalAndInstitutionalBuildings.rawValue))

        searchModel.executeSegmentFilterAction(element: NonResidential.CulturalAndInstitutionalBuildings.rawValue)
        XCTAssertEqual(searchModel.selectedNonResidentialElements, [])
        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: NonResidential.CulturalAndInstitutionalBuildings.rawValue))

        XCTAssertFalse(searchModel.isSegmentFilterSelected(element: "NotValidValue"))
        searchModel.executeSegmentFilterAction(element: "NotValidValue")
    }


    func testIsSegmentFilterSetIfAllSet() {
        XCTAssertFalse(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")

        searchModel.selectedInfrastructureElements = [.Tunnels, .MarineAndWaterInfrastructur]
        searchModel.selectedIndustrialElements = [.OilAndGas, .Chemicals]
        searchModel.selectedResidentialElements = [.MultiFamilyHousingUpToTenFloors, .MultiFamilyHousingAboveTenFloors]
        searchModel.selectedNonResidentialElements = [.HealthcareBuildings, .RetailBuildings]
        XCTAssertTrue(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")
    }

    func testIsSegmentFilterSetIfOnlyInfrastructureSet() {
        XCTAssertFalse(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")

        searchModel.selectedInfrastructureElements = [.Tunnels, .MarineAndWaterInfrastructur]
        XCTAssertTrue(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")
    }

    func testIsSegmentFilterSetIfOnlyIndustrialSet() {
        XCTAssertFalse(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")

        searchModel.selectedIndustrialElements = [.OilAndGas, .Chemicals]
        XCTAssertTrue(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")
    }

    func testIsSegmentFilterSetIfOnlyResidentialSet() {
        XCTAssertFalse(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")

        searchModel.selectedResidentialElements = [.MultiFamilyHousingAboveTenFloors]
        XCTAssertTrue(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")
    }

    func testIsSegmentFilterSetIfOnlyNonResidentialSet() {
        XCTAssertFalse(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")

        searchModel.selectedNonResidentialElements = [.OfficeBuildings]
        XCTAssertTrue(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")
    }

    func testIsSolutionFilterSet() {
        XCTAssertFalse(searchModel.isSolutionFilterSet(), "Incorrect value for isSolutionFilterSet()")

        searchModel.selectedSolutionTags = [.Basement]
        XCTAssertTrue(searchModel.isSolutionFilterSet(), "Incorrect value for isSolutionFilterSet()")
    }

    // Search filter

    func testSearchFilter() {
        searchModel.searchTerm = "GRODT"
        searchModel.setSelectedProduct(product: .Duo)

        searchModel.wallThicknessLowValue = 50
        searchModel.wallThicknessHighValue = 200
        searchModel.wallHeightLowValue = 100
        searchModel.wallHeightHighValue = 760

        searchModel.columnLengthLowValue = 23
        searchModel.columnLengthHighValue = 353
        searchModel.columnWidthLowValue = 23
        searchModel.columnWidthHighValue = 200
        searchModel.columnHeightLowValue = 89
        searchModel.columnHeightHighValue = 888

        searchModel.culvertThicknessLowValue = 34
        searchModel.culvertThicknessHighValue = 200
        searchModel.culvertHeightLowValue = 100
        searchModel.culvertHeightHighValue = 762

        searchModel.selectedInfrastructureElements = [.WaterPlants, .Airports, .Tunnels]
        searchModel.selectedIndustrialElements = [.Power, .IndustrializedManufacturing]
        searchModel.selectedResidentialElements = [.SingleFamilyHousing]
        searchModel.selectedNonResidentialElements = [.HealthcareBuildings, .LeisureAndHospitalityBuildings]
        searchModel.selectedSolutionTags = [.Tank, .ChamferCorner, .ConcreteShoringBeam, .Basement]

        let filter = searchModel.createSearchFilterObject(forSolutionTags: false)

        XCTAssertEqual(filter.searchTerm, "GRODT", "Incorrect searchTerm")
        XCTAssertEqual(filter.product, Product.Duo.rawValue, "Incorrect selectedProduct")

        XCTAssertEqual(filter.wallFilter.minThickness, 50, "Incorrect wallThicknessLowValue")
        XCTAssertEqual(filter.wallFilter.maxThickness, 200, "Incorrect wallThicknessHighValue")
        XCTAssertEqual(filter.wallFilter.minHeight, 100, "Incorrect wallHeightLowValue")
        XCTAssertEqual(filter.wallFilter.maxHeight, 760, "Incorrect wallHeightHighValue")

        XCTAssertEqual(filter.columnFilter.minLength, 23, "Incorrect columnLengthLowValue")
        XCTAssertEqual(filter.columnFilter.maxLength, 353, "Incorrect columnLengthHighValue")
        XCTAssertEqual(filter.columnFilter.minWidth, 23, "Incorrect columnWidthLowValue")
        XCTAssertEqual(filter.columnFilter.maxWidth, 200, "Incorrect columnWidthHighValue")
        XCTAssertEqual(filter.columnFilter.minHeight, 89, "Incorrect columnHeightLowValue")
        XCTAssertEqual(filter.columnFilter.maxHeight, 888, "Incorrect columnHeightHighValue")

        XCTAssertEqual(filter.culvertFilter.minThickness, 34, "Incorrect culvertThicknessLowValue")
        XCTAssertEqual(filter.culvertFilter.maxThickness, 200, "Incorrect culvertThicknessHighValue")
        XCTAssertEqual(filter.culvertFilter.minHeight, 100, "Incorrect culvertHeightLowValue")
        XCTAssertEqual(filter.culvertFilter.maxHeight, 762, "Incorrect culvertHeightHighValue")

        XCTAssertEqual(filter.infrastructureElements, ["Water Plants", "Airports", "Tunnels"], "Incorrect selectedInfrastructureElements")
        XCTAssertEqual(filter.industrialElements, ["Power", "Industrialized Manufacturing"], "Incorrect selectedIndustrialElements")
        XCTAssertEqual(filter.residentialElements, ["Single-Family Housing"], "Incorrect selectedResidentialElements")
        XCTAssertEqual(filter.nonResidentialElements, ["Healthcare Buildings", "Leisure & Hospitality Buildings"], "Incorrect selectedNonResidentialElements")
        XCTAssertEqual(filter.solutionTags, ["tank", "chamfer corner", "concrete shoring beam", "basement"], "Incorrect selectedSolutionTags")
    }

    func testSearchFilterForSolutionTags() {
        searchModel.searchTerm = "GRODT"
        searchModel.setSelectedProduct(product: .Duo)

        searchModel.wallThicknessLowValue = 50
        searchModel.wallThicknessHighValue = 200
        searchModel.wallHeightLowValue = 100
        searchModel.wallHeightHighValue = 760

        searchModel.columnLengthLowValue = 23
        searchModel.columnLengthHighValue = 353
        searchModel.columnWidthLowValue = 23
        searchModel.columnWidthHighValue = 200
        searchModel.columnHeightLowValue = 89
        searchModel.columnHeightHighValue = 888

        searchModel.culvertThicknessLowValue = 34
        searchModel.culvertThicknessHighValue = 200
        searchModel.culvertHeightLowValue = 100
        searchModel.culvertHeightHighValue = 762

        searchModel.selectedInfrastructureElements = [.WaterPlants, .Airports, .Tunnels]
        searchModel.selectedIndustrialElements = [.Power, .IndustrializedManufacturing]
        searchModel.selectedResidentialElements = [.SingleFamilyHousing]
        searchModel.selectedNonResidentialElements = [.HealthcareBuildings, .LeisureAndHospitalityBuildings]
        searchModel.selectedSolutionTags = [.Tank, .ChamferCorner, .ConcreteShoringBeam, .Basement]

        let filter = searchModel.createSearchFilterObject(forSolutionTags: true)

        XCTAssertEqual(filter.searchTerm, "GRODT", "Incorrect searchTerm")
        XCTAssertEqual(filter.product, Product.Duo.rawValue, "Incorrect selectedProduct")

        XCTAssertEqual(filter.wallFilter.minThickness, 50, "Incorrect wallThicknessLowValue")
        XCTAssertEqual(filter.wallFilter.maxThickness, 200, "Incorrect wallThicknessHighValue")
        XCTAssertEqual(filter.wallFilter.minHeight, 100, "Incorrect wallHeightLowValue")
        XCTAssertEqual(filter.wallFilter.maxHeight, 760, "Incorrect wallHeightHighValue")

        XCTAssertEqual(filter.columnFilter.minLength, 23, "Incorrect columnLengthLowValue")
        XCTAssertEqual(filter.columnFilter.maxLength, 353, "Incorrect columnLengthHighValue")
        XCTAssertEqual(filter.columnFilter.minWidth, 23, "Incorrect columnWidthLowValue")
        XCTAssertEqual(filter.columnFilter.maxWidth, 200, "Incorrect columnWidthHighValue")
        XCTAssertEqual(filter.columnFilter.minHeight, 89, "Incorrect columnHeightLowValue")
        XCTAssertEqual(filter.columnFilter.maxHeight, 888, "Incorrect columnHeightHighValue")

        XCTAssertEqual(filter.culvertFilter.minThickness, 34, "Incorrect culvertThicknessLowValue")
        XCTAssertEqual(filter.culvertFilter.maxThickness, 200, "Incorrect culvertThicknessHighValue")
        XCTAssertEqual(filter.culvertFilter.minHeight, 100, "Incorrect culvertHeightLowValue")
        XCTAssertEqual(filter.culvertFilter.maxHeight, 762, "Incorrect culvertHeightHighValue")

        XCTAssertEqual(filter.infrastructureElements, ["Water Plants", "Airports", "Tunnels"], "Incorrect selectedInfrastructureElements")
        XCTAssertEqual(filter.industrialElements, ["Power", "Industrialized Manufacturing"], "Incorrect selectedIndustrialElements")
        XCTAssertEqual(filter.residentialElements, ["Single-Family Housing"], "Incorrect selectedResidentialElements")
        XCTAssertEqual(filter.nonResidentialElements, ["Healthcare Buildings", "Leisure & Hospitality Buildings"], "Incorrect selectedNonResidentialElements")
        XCTAssertEqual(filter.solutionTags, nil, "Incorrect selectedSolutionTags")
    }
}
