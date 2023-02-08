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
    @State private var showDownloadDialog: Bool = false
    @State private var showing2DAlert: Bool = false
    @State private var showingBQAlert: Bool = false
    @State private var showingPhotosAlert: Bool = false
    @State private var showingExporter = false
    @State var pdfFile: PdfFile = PdfFile()
    var projectModel: ProjectModel
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
                if (projectModel.pdfDocument != nil && projectModel.pdfDocument != PDFDocument()) {
                    pdfFile.pdfDocument = projectModel.pdfDocument!
                    self.showingExporter = true
                    self.showDownloadDialog = false
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
                projectModel.allPhotosDownloadedSuccessful = false
                ImageSaver(projectModel: projectModel, urls: project.pictures!).saveToLibrary()
                self.showDownloadDialog = false
            }
            .disabled(project.pictures == nil || project.pictures!.count < 1)
            .onChange(of: projectModel.allPhotosDownloadedSuccessful) { downloadSuccessful in
                showingPhotosAlert = downloadSuccessful
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
        .fileExporter(isPresented: self.$showingExporter,
                      document: pdfFile,
                      contentType: .pdf,
                      defaultFilename: project.drawingNumber) { result in
                switch result {
                case .success(let url):
                    SharedLogger.shared().info("Saved PDF to \(url)")
                case .failure(let error):
                    SharedLogger.shared().error("Error downloading PDF: \(error.localizedDescription)")
                }
            }
    }

    private func showDownloadBQOption() -> Bool {
        return project.billOfQuantity == nil || project.billOfQuantity!.count < 1 ||  project.originBQLink == nil || project.originBQLink!.isEmpty
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        let project = Project(id: UUID().uuidString,
                              projectNumber: "dasd",
                              projectName: "adsd",
                              drawingNumber: "dasd")
        DownloadButton(projectModel: ProjectModel(), project: project)
    }
}
