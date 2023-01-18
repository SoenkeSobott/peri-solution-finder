//
//  SearchViewUITest.swift
//  PeriSolutionFinderUITests
//
//  Created by Sönke Sobott on 18.01.23.
//

import XCTest

final class SearchViewUITest: XCTestCase {

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func testCorrectHeading() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertEqual("Find your Reference Solution", app.staticTexts["searchHeading"].label)
    }

}
