//
//  ProjectHeaderBar.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 31.01.23.
//

import SwiftUI
import UniformTypeIdentifiers
import PDFKit

struct ProjectHeaderBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showDownloadDialog: Bool = false
    @State private var showingAlert: Bool = false
    @State private var showingExporter = false
    @State private var pdfFile: PdfFile = PdfFile()
    var twoDModel: TwoDModel
    var project: Project

    var body: some View {
        HStack() {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                NavigationButton(systemName: "arrow.left")
            })
            .padding(.leading, 20)

            Spacer()

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
                        self.showingAlert = true
                    }
                }
            }
            .alert("Please wait until the download is complete.", isPresented: $showingAlert) {
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
}

struct ProjectHeaderBar_Previews: PreviewProvider {
    static var previews: some View {
        let project = Project(id: UUID().uuidString,
                              projectNumber: "12345",
                              projectName: "Test Project 123",
                              drawingNumber: "00203020312")
        ProjectHeaderBar(twoDModel: TwoDModel(), project: project)
    }
}
