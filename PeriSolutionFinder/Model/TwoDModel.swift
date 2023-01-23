//
//  TwoDModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 23.01.23.
//

import SwiftUI
import PDFKit

class TwoDModel: ObservableObject {
    @Published var pdfDocument: PDFDocument?
    @Published var shouldExecutePDFDownload: Bool = true
    @Published var pdfIsLoading: Bool = true

    func loadPdfDocumetInBackground(url: String) {
        pdfIsLoading = true
        let dispatchQueue = DispatchQueue(label: "PdfLoadingQueue", qos: .background)

        dispatchQueue.async{
            let url = URL(string: url)
            if url == nil { return }
            let doc = PDFDocument(url: url!)
            if (doc != nil) {
                DispatchQueue.main.async{
                    self.pdfDocument = doc!
                    self.pdfIsLoading = false
                }
            } else {
                SharedLogger.shared().error("PDF document is nil")
                self.pdfIsLoading = false
            }
        }
    }
}
