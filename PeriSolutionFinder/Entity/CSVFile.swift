//
//  CSVFile.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 31.01.23.
//

import SwiftUI
import PDFKit
import UniformTypeIdentifiers

struct CSVFile: FileDocument {
    // tell the system we support only PDF
    static var readableContentTypes = [UTType.commaSeparatedText]

    // by default our document is empty
    var csvData: String = ""

    // a simple initializer that creates new, empty document
    init(initialCSV: String = "") {
        csvData = initialCSV
    }

    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            csvData = String(data: data, encoding: .utf8)!
        }
    }

    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = csvData.description.data(using: .utf8)
        return FileWrapper(regularFileWithContents: data!)
    }
}
