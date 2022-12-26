//
//  SharedLogger.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 26.12.22.
//

import Foundation
import OSLog

class SharedLogger {

    private let LOGGER: Logger

    // Initialization
    private init() {
        self.LOGGER = Logger(subsystem: "com.soenkesobott.PeriSolutionFinder", category: "main")
    }

    class func shared() -> Logger {
        return SharedLogger().LOGGER
    }

}
