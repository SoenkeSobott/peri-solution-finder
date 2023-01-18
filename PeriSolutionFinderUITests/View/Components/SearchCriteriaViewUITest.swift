//
//  SearchCriteriaViewUITest.swift
//  PeriSolutionFinderUITests
//
//  Created by Sönke Sobott on 18.01.23.
//

import XCTest

final class SearchCriteriaViewUITest: XCTestCase {


    func testProductButtonExists() throws {
        let app = XCUIApplication()
        app.launch()

        let productButton = app.buttons["productButton"]
        XCTAssertTrue(productButton.exists)
        XCTAssertEqual("Product", productButton.label)
    }

    func testStructureButtonExists() throws {
        let app = XCUIApplication()
        app.launch()

        let structureButton = app.buttons["structureButton"].firstMatch
        XCTAssertTrue(structureButton.exists)
        XCTAssertEqual("Structure", structureButton.label)
    }

    func testSegmentButtonExists() throws {
        let app = XCUIApplication()
        app.launch()

        let segmentButton = app.buttons["segmentButton"].firstMatch
        XCTAssertTrue(segmentButton.exists)
        XCTAssertEqual("Segment", segmentButton.label)
    }

    func testSolutionButtonExists() throws {
        let app = XCUIApplication()
        app.launch()

        let solutionButton = app.buttons["solutionButton"]
        XCTAssertTrue(solutionButton.exists)
        XCTAssertEqual("Solution", solutionButton.label)
    }

}
