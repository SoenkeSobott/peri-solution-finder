//
//  Network.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.12.22.
//

import SwiftUI

class Network: ObservableObject {
    @Published var projects: [Project] = []
    @Published var projectsLoading: Bool = false

    func getProjects(searchTerm: String,
                     product: Product?,
                     minThickness: Double,
                     maxThickness: Double,
                     minHeight: Double,
                     maxHeight: Double) {
        projectsLoading = true
        // Create URL
        guard let url = URL(string: "https://solutionx-project-service.azurewebsites.net/projects") else { fatalError("Missing URL") }
        SharedLogger.shared().info("URL: \(url)")

        // Create Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let cmdParams: [String: String] =  ["searchTerm":"\(searchTerm)", "product": "\(product != nil ? product!.rawValue : "")",
                                            "minThickness": "\(minThickness)", "maxThickness": "\(maxThickness)",
                                            "minHeight": "\(minHeight)", "maxHeight": "\(maxHeight)"]
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: cmdParams)
        } catch let error {
            print(error.localizedDescription)
        }

        // Send Request
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                SharedLogger.shared().error("Request error: \(error)")
                self.projectsLoading = false
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedProjects = try JSONDecoder().decode([Project].self, from: data)
                        self.projects = decodedProjects
                        self.projectsLoading = false
                    } catch let error {
                        SharedLogger.shared().error("Error decoding: \(error)")
                        self.projectsLoading = false
                    }
                }
            } else {
                SharedLogger.shared().error("Request error: \(response.statusCode)")
                DispatchQueue.main.async {
                    self.projectsLoading = false
                }
            }
        }

        dataTask.resume()
    }
}
