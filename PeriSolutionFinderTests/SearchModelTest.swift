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
        XCTAssertEqual(searchModel.wallThicknessLowValue, 0, "Incorrect Default wallThicknessLowValue")
        XCTAssertEqual(searchModel.wallThicknessHighValue, 500, "Incorrect Default wallThicknessHighValue")
        XCTAssertEqual(searchModel.wallHeightLowValue, 0, "Incorrect Default wallHeightLowValue")
        XCTAssertEqual(searchModel.wallHeightHighValue, 1000, "Incorrect Default wallHeightHighValue")
    }

    func testDefaultColumnValues() {
        XCTAssertEqual(searchModel.columnThicknessLowValue, 0, "Incorrect Default columnThicknessLowValue")
        XCTAssertEqual(searchModel.columnThicknessHighValue, 500, "Incorrect Default columnThicknessHighValue")
        XCTAssertEqual(searchModel.columnHeightLowValue, 0, "Incorrect Default columnHeightLowValue")
        XCTAssertEqual(searchModel.columnHeightHighValue, 1000, "Incorrect Default columnHeightHighValue")
    }

    func testDefaultSegmentValues() {
        XCTAssertEqual(searchModel.segmentElements, [.Residential, .NonResidential, .Infrastructure, .Industrial], "Incorrect Default segmentElements")
        XCTAssertEqual(searchModel.selectedSegment, .Infrastructure, "Incorrect Default selectedSegment")
    }

    func testDefaultInfrastructureValues() {
        XCTAssertEqual(searchModel.infrastructureElements, [.Bridges, .Tunnels, .LandTraffics, .Airports, .MarineAndWaterInfrastructur, .WaterPlants], "Incorrect Default infrastructureElements")
        XCTAssertEqual(searchModel.selectedSegment, .Infrastructure, "Incorrect Default selectedSegment")
        XCTAssertEqual(searchModel.selectedInfrastructureElements, [], "Incorrect Default selectedInfrastructureElements")
        XCTAssertEqual(searchModel.selectedInfrastructure, nil, "Incorrect Default selectedInfrastructure")
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
        searchModel.columnThicknessLowValue = 23
        searchModel.columnThicknessHighValue = 353
        searchModel.columnHeightLowValue = 89
        searchModel.columnHeightHighValue = 888
        searchModel.selectedInfrastructureElements = [.WaterPlants, .Airports, .Tunnels]
        searchModel.selectedSolutionTags = [.Tank, .ChamferCorner, .ConcreteShoringBeam, .Basement]

        searchModel.resetAllFilters()

        XCTAssertEqual(searchModel.searchTerm, "", "Incorrect Default searchTerm")
        XCTAssertEqual(searchModel.getSelectedProduct(), nil, "Incorrect default selectedProduct")
        XCTAssertEqual(searchModel.wallThicknessLowValue, 0, "Incorrect Default wallThicknessLowValue")
        XCTAssertEqual(searchModel.wallThicknessHighValue, 500, "Incorrect Default wallThicknessHighValue")
        XCTAssertEqual(searchModel.wallHeightLowValue, 0, "Incorrect Default wallHeightLowValue")
        XCTAssertEqual(searchModel.wallHeightHighValue, 1000, "Incorrect Default wallHeightHighValue")
        XCTAssertEqual(searchModel.columnThicknessLowValue, 0, "Incorrect Default columnThicknessLowValue")
        XCTAssertEqual(searchModel.columnThicknessHighValue, 500, "Incorrect Default columnThicknessHighValue")
        XCTAssertEqual(searchModel.columnHeightLowValue, 0, "Incorrect Default columnHeightLowValue")
        XCTAssertEqual(searchModel.columnHeightHighValue, 1000, "Incorrect Default columnHeightHighValue")
        XCTAssertEqual(searchModel.selectedInfrastructureElements, [], "Incorrect Default selectedInfrastructureElements")
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
        searchModel.columnThicknessLowValue = 200
        XCTAssertTrue(searchModel.isStructureFilterSet(), "Incorrect value for isStructureFilterSet()")
    }

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



    func testIsColumnFilterSetWhenOnlyThicknessLowValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnThicknessLowValue = 1
        XCTAssertTrue(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")
    }

    func testIsColumnFilterSetWhenOnlyThicknessHighValueSet() {
        XCTAssertFalse(searchModel.isColumnFilterSet(), "Incorrect value for isColumnFilterSet()")

        searchModel.columnHeightHighValue = 499
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

    func testIsSegmentFilterSet() {
        XCTAssertFalse(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")

        searchModel.selectedInfrastructureElements = [.Tunnels, .MarineAndWaterInfrastructur]
        XCTAssertTrue(searchModel.isSegmentFilterSet(), "Incorrect value for isSegmentFilterSet()")
    }

    func testIsSolutionFilterSet() {
        XCTAssertFalse(searchModel.isSolutionFilterSet(), "Incorrect value for isSolutionFilterSet()")

        searchModel.selectedSolutionTags = [.Basement]
        XCTAssertTrue(searchModel.isSolutionFilterSet(), "Incorrect value for isSolutionFilterSet()")
    }


}
