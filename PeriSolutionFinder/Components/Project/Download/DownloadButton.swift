//
//  DownloadButton.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 31.01.23.
//

import SwiftUI
import UniformTypeIdentifiers
import PDFKit

struct DownloadButton: View {
    @StateObject var downloadModel: DownloadModel = DownloadModel()
    @State private var showDownloadDialog: Bool = false
    @State private var showing2DAlert: Bool = false
    @State private var showingPhotosAlert: Bool = false
    @State private var showingExporter = false
    @State private var pdfFile: PdfFile = PdfFile()
    var twoDModel: TwoDModel
    var project: Project

    var body: some View {
        Button(action: {
            self.showDownloadDialog.toggle()
        }, label: {
            NavigationButton(systemName: "ellipsis")
        })
        .padding(.trailing, 20)
        .confirmationDialog("Download", isPresented: $showDownloadDialog, titleVisibility: .visible) {
            Button("Download 2D") {
                if (twoDModel.pdfDocument != nil && twoDModel.pdfDocument != PDFDocument()) {
                    pdfFile.pdfDocument = twoDModel.pdfDocument!
                    self.showDownloadDialog = false
                    self.showingExporter = true
                } else {
                    self.showing2DAlert = true
                }
            }

            Button("Download Photos") {
                downloadModel.allPhotosDownloadedSuccessful = false
                ImageSaver(downloadModel: downloadModel, urls: project.pictures!).saveToLibrary()
                self.showDownloadDialog = false
            }
            .disabled(project.pictures == nil || project.pictures!.count < 1)
            .onChange(of: downloadModel.allPhotosDownloadedSuccessful) { downloadSuccessful in
                showingPhotosAlert = downloadSuccessful
            }
        }
        .alert("Please wait until the download is complete.", isPresented: $showing2DAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("All photos downloaded.", isPresented: $showingPhotosAlert) {
            Button("OK", role: .cancel) { }
        }
        .fileExporter(isPresented: $showingExporter,
                      document: pdfFile,
                      contentType: UTType.pdf,
                      defaultFilename: project.drawingNumber) { result in
            switch result {
            case .success(let url):
                SharedLogger.shared().info("Saved to \(url)")
            case .failure(let error):
                SharedLogger.shared().error("Error downloading PDF: \(error.localizedDescription)")
            }
        }
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        let project = Project(id: UUID().uuidString,
                              projectNumber: "dasd",
                              projectName: "adsd",
                              drawingNumber: "dasd")
        DownloadButton(twoDModel: TwoDModel(), project: project)
    }
}
