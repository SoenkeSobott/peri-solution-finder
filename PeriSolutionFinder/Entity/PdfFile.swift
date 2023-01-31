//
//  PdfFile.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 31.01.23.
//

import SwiftUI
import PDFKit
import UniformTypeIdentifiers

struct PdfFile: FileDocument {
    // tell the system we support only PDF
    static var readableContentTypes = [UTType.pdf]

    // by default our document is empty
    var pdfDocument = PDFDocument()

    // a simple initializer that creates new, empty document
    init(initialPDF: PDFDocument = PDFDocument()) {
        pdfDocument = initialPDF
    }

    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            pdfDocument = PDFDocument(data: data)!
        }
    }

    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = pdfDocument.dataRepresentation()
        return FileWrapper(regularFileWithContents: data!)
    }
}
