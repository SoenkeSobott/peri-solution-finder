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
    @Published var solutionTags: [SolutionTag] = []
    @Published var solutionTagsLoading: Bool = false

    func getProjects(searchModel: SearchModel) {
        projectsLoading = true
        // Create URL
        guard let url = URL(string: "https://solutionx-project-service.azurewebsites.net/projects") else { fatalError("Missing URL") }
        SharedLogger.shared().info("URL: \(url)")

        // Create Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")


        do {
            urlRequest.httpBody = try JSONEncoder().encode(searchModel.createSearchFilterObject(forSolutionTags: false))
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

    func getSolutionTags(searchModel: SearchModel) {
        solutionTagsLoading = true
        // Create URL
        guard let url = URL(string: "https://solutionx-project-service.azurewebsites.net/projects/solution-tags") else { fatalError("Missing URL") }
        SharedLogger.shared().info("URL: \(url)")

        // Create Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")


        do {
            urlRequest.httpBody = try JSONEncoder().encode(searchModel.createSearchFilterObject(forSolutionTags: true))
        } catch let error {
            print(error.localizedDescription)
        }

        // Send Request
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                SharedLogger.shared().error("Request error: \(error)")
                DispatchQueue.main.async {
                    self.solutionTagsLoading = false
                }
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let solutionTagResponse = try JSONDecoder().decode(SolutionTagResponse.self, from: data)
                        self.solutionTags = solutionTagResponse.solutionTags
                        // Update selectedSolutionTags
                        searchModel.selectedSolutionTags = searchModel.selectedSolutionTags.filter {
                            solutionTagResponse.solutionTags.contains($0)
                        }
                        self.solutionTagsLoading = false
                    } catch let error {
                        SharedLogger.shared().error("Error decoding: \(error)")
                        self.solutionTagsLoading = false
                    }
                }
            } else {
                SharedLogger.shared().error("Request error: \(response.statusCode)")
                DispatchQueue.main.async {
                    self.solutionTagsLoading = false
                }
            }
        }

        dataTask.resume()
    }
}
