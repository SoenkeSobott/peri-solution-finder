//
//  SearchViewUITest.swift
//  PeriSolutionFinderUITests
//
//  Created by Sönke Sobott on 18.01.23.
//

import XCTest

final class SearchViewUITest: XCTestCase {

    func testCorrectHeading() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertEqual("Find your Reference Solution", app.staticTexts["searchHeading"].label)
    }

}
