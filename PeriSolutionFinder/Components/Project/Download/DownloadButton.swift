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
    @State private var showingBQAlert: Bool = false
    @State private var showingPhotosAlert: Bool = false
    @State private var showingPDFExporter = false
    @State private var showingCSVExporter = false
    @State private var pdfFile: PdfFile = PdfFile()
    @State private var csvFile: CSVFile = CSVFile()
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
                    self.showingPDFExporter = true
                } else {
                    self.showing2DAlert = true
                }
            }

            Button(action: {
                showingBQAlert = true
            }) {
                Text("Download BQ")
            }
            .disabled(showDownloadBQOption())

            Button("Download Photos") {
                downloadModel.allPhotosDownloadedSuccessful = false
                ImageSaver(downloadModel: downloadModel, urls: project.pictures!).saveToLibrary()
                self.showDownloadDialog = false
            }
            .disabled(project.pictures == nil || project.pictures!.count < 1)
            .onChange(of: downloadModel.allPhotosDownloadedSuccessful) { downloadSuccessful in
                showingPhotosAlert = downloadSuccessful
            }

            Button("Download Info") {
                csvFile.csvData = getCSVDataString(project: project)
                self.showDownloadDialog = false
                self.showingCSVExporter = true
            }
        }
        .alert("Please wait until the download is complete.", isPresented: $showing2DAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert(isPresented: $showingBQAlert) {
            Alert(title: Text("Notice"),
                  message: Text("You are being redirected to download the file. Once the download is complete, the file will be available in your local files."),
                  primaryButton: .default(Text("Download"), action: {
                if let url = URL(string: project.originBQLink ?? "") {
                   UIApplication.shared.open(url)
                }
            }), secondaryButton: .cancel(Text("Cancel")))
        }
        .alert("All photos downloaded.", isPresented: $showingPhotosAlert) {
            Button("OK", role: .cancel) { }
        }
        .fileExporter(isPresented: $showingPDFExporter,
                      document: pdfFile,
                      contentType: UTType.pdf,
                      defaultFilename: project.drawingNumber) { result in
            switch result {
            case .success(let url):
                SharedLogger.shared().info("Saved PDF to \(url)")
            case .failure(let error):
                SharedLogger.shared().error("Error downloading PDF: \(error.localizedDescription)")
            }
        }
        .fileExporter(isPresented: $showingCSVExporter,
                      document: csvFile,
                      contentType: UTType.commaSeparatedText,
                      defaultFilename: project.projectName) { result in
            switch result {
            case .success(let url):
                SharedLogger.shared().info("Saved CSV to \(url)")
            case .failure(let error):
                SharedLogger.shared().error("Error downloading CSV: \(error.localizedDescription)")
            }
        }
    }

    private func showDownloadBQOption() -> Bool {
        return project.billOfQuantity == nil || project.billOfQuantity!.count < 1 ||  project.originBQLink == nil || project.originBQLink!.isEmpty
    }

}

private func getCSVDataString(project: Project) -> String {
    let names = ["Project Name","Project Number", "Product", "Main Structure", "Length [cm]", "Width [cm]", "Thickness [cm]", "Formwork Height [cm]", "Max pour Height [cm]", "M2 of Concrete", "M2 of Formwork", "Shoring Height [m]", "Slab Thickness [cm]", "M3 of Shoring", "Location", "Segment Level 1", "Segment Level 2", "Solution Tags"]
    let values: [String] = [
        escapeString(string: project.projectName),
        escapeString(string: project.projectNumber),
        escapeString(string: project.product),
        escapeString(string: project.mainStructure),
        escapeString(string: project.lenght?.description),
        escapeString(string: project.width?.description),
        escapeString(string: project.thickness?.description),
        escapeString(string: project.height?.description),
        escapeString(string: project.maxPourHeight?.description),
        escapeString(string: project.m2OfConcrete?.description),
        escapeString(string: project.m2OfFormwork?.description),
        escapeString(string: project.shoringHeight?.description),
        escapeString(string: project.slabThickness?.description),
        escapeString(string: project.m3OfShoring?.description),
        escapeString(string: project.location),
        escapeString(string: project.segmentLevelOne),
        escapeString(string: project.segmentLevelTwo),
        escapeString(string: project.solutionTags?.description)]

    var data = [["names", "values"]]
    for (index, name) in names.enumerated() {
        data.append([name, values[index]])
    }

    return data.map({ $0.joined(separator: ",") }).joined(separator: "\n")
}

private func escapeString(string: String?) -> String {
    let saveString = string ?? ""
    return saveString.replacing(",", with: " - ")
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
