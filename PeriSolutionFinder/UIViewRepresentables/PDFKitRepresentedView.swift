//
//  PDFKitRepresentedView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI
import PDFKit

struct PDFKitRepresentedView: UIViewRepresentable {
    var url: String
    @Binding var pdfDocument: PDFDocument
    @Binding var pdfIsLoading: Bool

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        loadPdfDocumetInBackground(url: url)

        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        pdfView.backgroundColor = UIColor.clear
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = pdfDocument
    }

    func loadPdfDocumetInBackground(url: String) {
        let dispatchQueue = DispatchQueue(label: "PdfLoadingQueue", qos: .background)

        dispatchQueue.async{
            let url = URL(string: url)
            if url == nil { return }
            let doc = PDFDocument(url: url!)!
            DispatchQueue.main.async{
                self.pdfDocument = doc
                self.pdfIsLoading = false
            }
        }
    }
}

