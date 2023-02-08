//
//  ProjectModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI
import PDFKit

class ProjectModel: ObservableObject {
    // 2D View
    @Published var pdfDocument: PDFDocument?
    @Published var pdfIsLoading: Bool = false
    @Published var downloadProgress: Double = 0
    private var downloadTask: URLSessionDataTask?

    // BQ View
    @Published var shouldDownloadAvailabilities: Bool = true
    @Published var articleAvailabilities: [ArticleAvailability] = []

    // Download
    @Published var allPhotosDownloadedSuccessful: Bool = false


    // 2D View
    func downloadPDF(url: String) {
        pdfIsLoading = true
        let url = URL(string: url)!
        let request = URLRequest(url: url)
        downloadTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    let doc = PDFDocument(data: data)
                    if (doc != nil) {
                        self.pdfDocument = doc
                        self.pdfIsLoading = false
                    } else {
                        SharedLogger.shared().error("PDF document is nil")
                        self.pdfIsLoading = false
                    }
                }
            }
        }
        downloadTask!.resume()

        // Use a Timer to check the progress of the download every 0.1 seconds
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if let response = self.downloadTask?.response as? HTTPURLResponse {
                let totalSize = response.expectedContentLength
                let downloadedSize = self.downloadTask!.countOfBytesReceived
                let progress = Double(downloadedSize) / Double(totalSize)
                self.downloadProgress = progress
                if self.downloadTask!.state == .completed {
                    timer.invalidate()
                    SharedLogger.shared().info("Timer for download task invalidated")
                }
            }
        }
    }

    func isPdfNotLoadable() -> Bool {
        return (!pdfIsLoading && pdfDocument == nil)
    }

    func cancelDownloadTask() {
        SharedLogger.shared().info("Canceled Task: \(self.downloadTask.debugDescription)")
        downloadTask?.cancel()
    }

}
