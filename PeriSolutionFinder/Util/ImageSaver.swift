//
//  ImageSaver.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 31.01.23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

class ImageSaver: NSObject {
    private var downloadModel: DownloadModel
    private var urls: [String]
    private var downloadErrorOccured = false
    private var downloadCounter = 0

    init(downloadModel: DownloadModel, urls: [String]) {
        self.downloadModel = downloadModel
        self.urls = urls
    }

    private func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        downloadCounter+=1
        if (error != nil) {
            downloadErrorOccured = true
            SharedLogger.shared().error("Error saving image \(error.debugDescription)")
        } else {
            SharedLogger.shared().info("Saved image succesfull to local photos")
        }
        if (downloadCounter >= urls.count && !downloadErrorOccured) {
            downloadModel.allPhotosDownloadedSuccessful = true
        }
    }

    func saveToLibrary() {
        for url in urls {
            getUIImage(from: URL(string: url)!) { image in
                self.writeToPhotoAlbum(image: image!)
            }
        }
    }

    private func getUIImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        SDWebImageManager.shared.loadImage(with: url, options: .continueInBackground, progress: nil) { (image, _, _, _, _, _) in
            completion(image)
        }
    }
}
