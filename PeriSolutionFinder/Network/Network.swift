//
//  Network.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.12.22.
//

import SwiftUI

struct Filter: Identifiable, Encodable {
    var id = UUID()
    var searchTerm: String
    var product: String
    var wallFilter: ThicknessAndHeightFilter
    var columnFilter: ThicknessAndHeightFilter
    var infrastructureElements: [String]
}

struct ThicknessAndHeightFilter: Identifiable, Encodable {
    var id = UUID()
    var minThickness: Double
    var maxThickness: Double
    var minHeight: Double
    var maxHeight: Double
}

class Network: ObservableObject {
    @Published var projects: [Project] = []
    @Published var projectsLoading: Bool = false

    func getProjects(searchTerm: String,
                     product: Product?,
                     wallMinThickness: Double,
                     wallMaxThickness: Double,
                     wallMinHeight: Double,
                     wallMaxHeight: Double,
                     columnMinThickness: Double,
                     columnMaxThickness: Double,
                     columnMinHeight: Double,
                     columnMaxHeight: Double,
                     infrastructureElements: [Infrastructure]) {
        projectsLoading = true
        // Create URL
        guard let url = URL(string: "https://solutionx-project-service.azurewebsites.net/projects") else { fatalError("Missing URL") }
        SharedLogger.shared().info("URL: \(url)")

        // Create Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let filter = Filter(searchTerm: searchTerm, product: product != nil ? product!.rawValue : "",
                            wallFilter: ThicknessAndHeightFilter(minThickness: wallMinThickness, maxThickness: wallMaxThickness,
                                                                 minHeight: wallMinHeight, maxHeight: wallMaxHeight),
                            columnFilter: ThicknessAndHeightFilter(minThickness: columnMinThickness, maxThickness: columnMaxThickness,
                                                                   minHeight: columnMinHeight, maxHeight: columnMaxHeight),
                            infrastructureElements: infrastructureElements.map { $0.rawValue })
        do {
            urlRequest.httpBody = try JSONEncoder().encode(filter)
        } catch let error {
            print(error.localizedDescription)
        }

        // Send Request
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                SharedLogger.shared().error("Request error: \(error)")
                DispatchQueue.main.async {
                    self.projectsLoading = false
                }
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
