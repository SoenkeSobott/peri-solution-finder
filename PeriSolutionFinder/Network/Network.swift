//
//  Network.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.12.22.
//

import SwiftUI

class Network: ObservableObject {
    @Published var projects: [Project] = []

    func getProjects(searchTerm: String,
                     product: Product?,
                     minThickness: Double,
                     maxThickness: Double,
                     minHeight: Double,
                     maxHeight: Double) {
        guard var url = URL(string: "https://solutionx-project-service.azurewebsites.net/projects") else { fatalError("Missing URL") }

        // Add filter parameters
        if (product != nil) {
            url.append(queryItems: [
                URLQueryItem(name: "product", value: product?.rawValue)
            ])
        }
        url.append(queryItems: [
            URLQueryItem(name: "searchTerm", value: searchTerm),
            URLQueryItem(name: "minThickness", value: minThickness.description),
            URLQueryItem(name: "maxThickness", value: maxThickness.description),
            URLQueryItem(name: "minHeight", value: minHeight.description),
            URLQueryItem(name: "maxHeight", value: maxHeight.description)
        ])

        SharedLogger.shared().info("URL: \(url)")

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                SharedLogger.shared().error("Request error: \(error)")
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedProjects = try JSONDecoder().decode([Project].self, from: data)
                        self.projects = decodedProjects
                    } catch let error {
                        SharedLogger.shared().error("Error decoding: \(error)")
                    }
                }
            }
        }

        dataTask.resume()
    }
}
