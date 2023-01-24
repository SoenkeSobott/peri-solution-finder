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
    @ObservedObject var twoDModel: TwoDModel

    var body: some View {
        if (viewLink != "") {
            ZStack {
                ProgressView(String(format: "%.0f%%", twoDModel.downloadProgress * 100), value: twoDModel.downloadProgress, total: 1)
                    .tint(Color("PeriRed"))
                    .progressViewStyle(.linear)
                    .opacity(twoDModel.pdfIsLoading ? 1 : 0)
                    .frame(width: UIScreen.main.bounds.width*0.8)

                PDFKitRepresentedView(pdfDocument: $twoDModel.pdfDocument)
                    .opacity(twoDModel.pdfIsLoading ? 0 : 1)
                    .frame(width: UIScreen.main.bounds.width*0.9)
                    .cornerRadius(25)

                NotLoadableTwoDViewMessage()
                    .opacity(twoDModel.isPdfNotLoadable() ? 1 : 0)
            }
            .onAppear {
                if (twoDModel.pdfDocument == nil && !twoDModel.pdfIsLoading) {
                    twoDModel.downloadPDF(url: viewLink)
                }
            }
        } else {
            NotLoadableTwoDViewMessage()
        }
    }
}


struct TwoDView_Previews: PreviewProvider {
    static var previews: some View {
        TwoDView(viewLink: "", twoDModel: TwoDModel())
    }
}

struct NotLoadableTwoDViewMessage: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Sorry!")
                .text()
            Text("There is no 2D drawing for this project.")
                .text()
        }
    }
}

