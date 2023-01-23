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
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))

                PDFKitRepresentedView(pdfDocument: $twoDModel.pdfDocument)
                    .opacity(twoDModel.pdfIsLoading ? 0  : 1)
                    .frame(width: UIScreen.main.bounds.width*0.9)
                    .cornerRadius(25)
            }
            .onAppear {
                if (twoDModel.pdfDocument == nil) {
                    twoDModel.loadPdfDocumetInBackground(url: viewLink)
                } else {
                    twoDModel.pdfIsLoading = false
                }
            }
        } else {
            VStack(spacing: 20) {
                Text("Sorry!")
                    .text()
                Text("There is no 2D drawing for this project.")
                    .text()
            }
        }
    }
}



struct TwoDView_Previews: PreviewProvider {
    static var previews: some View {
        TwoDView(viewLink: "", twoDModel: TwoDModel())
    }
}

