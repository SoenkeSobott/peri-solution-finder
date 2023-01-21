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

    func testDefaultSearchCriteriaValue() {
        XCTAssertEqual(searchModel.selectedCriteria, SearchCriteria.Product, "Incorrect Default selectedCriteria")
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
        XCTAssertEqual(searchModel.segmentElements, [.Residential, .NonResidential, .Infrastructure, .Industrial], "Incorrect Default segmentElements")
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

    func testDefaultIResidentialValues() {
        XCTAssertEqual(searchModel.residentialElements, [.MultiFamilyHousingAboveTenFloors, .MultiFamilyHousingUpToTenFloors, .SingleFamilyHousing], "Incorrect Default residentialElements")
        XCTAssertEqual(searchModel.selectedResidentialElements, [], "Incorrect Default residentialElements")
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
        XCTAssertEqual(searchModel.solutionTags, [.HighQualityConcreteSurface, .Shaft, .AFrame, .AnchorToExistingWall, .Basement, .ChamferCorner, .CircularWall, .ColumWithTieRodAndNonTieRodVersion, .ColumnWithoutTieRod, .ColumnWithTieRod, .ConcreteShoringBeam, .DoubleSided, .DrainageChannel, .EquipmentFoundation, .Inclined, .MockUp, .Monolithic, .SingleSided, .SlabAndBeamInOnePour, .SludgePumpTank, .SpindleSupport, .StraightWall, .Tank, .TemporaryStructure, .Traveller, .TunnelSideWall, .TWall, .Underground, .UtilityTunnel, .WallAndSlabInOnePour, .WallPost, .WallWithVoids], "Incorrect Default solutionTags")
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


    func testIsSegmentFilterSetIfAllSet() {
        XCTAssertFalse(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")

        searchModel.selectedInfrastructureElements = [.Tunnels, .MarineAndWaterInfrastructur]
        searchModel.selectedIndustrialElements = [.OilAndGas, .Chemicals]
        searchModel.selectedResidentialElements = [.MultiFamilyHousingUpToTenFloors, .MultiFamilyHousingAboveTenFloors]
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

    func testIsSolutionFilterSet() {
        XCTAssertFalse(searchModel.isSolutionFilterSet(), "Incorrect value for isSolutionFilterSet()")

        searchModel.selectedSolutionTags = [.Basement]
        XCTAssertTrue(searchModel.isSolutionFilterSet(), "Incorrect value for isSolutionFilterSet()")
    }


}
