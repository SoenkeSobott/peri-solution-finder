//
//  TwoDView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.12.22.
//

import SwiftUI
import PDFKit

struct TwoDView: View {

    let viewLink: String
    @State private var pdfIsLoading: Bool = true
    @State private var pdfDocument: PDFDocument = PDFDocument()

    var body: some View {
        Text("Loading...")

        PDFKitRepresentedView(url: viewLink, pdfDocument: $pdfDocument, pdfIsLoading: $pdfIsLoading)
            .opacity(self.pdfIsLoading ? 0 : 1)
            .frame(width: UIScreen.main.bounds.width*0.9)
            .cornerRadius(25)
    }
}



struct TwoDView_Previews: PreviewProvider {
    static var previews: some View {
        TwoDView(viewLink: "")
    }
}

