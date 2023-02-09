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
    @Published var articles: [Article] = []
    @Published var articlesLoading: Bool = false
    @Published var articlesAvailabilityLoading: Bool = false

    // URLS
    let baseURL = "https://solutionx-project-service.azurewebsites.net"

    func getProjects(searchModel: SearchModel) {
        projectsLoading = true
        // Create URL
        guard let url = URL(string: baseURL + "/projects") else { fatalError("Missing URL") }
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
        guard let url = URL(string: baseURL + "/projects/solution-tags") else { fatalError("Missing URL") }
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

    func getAllArticles() {
        articlesLoading = true
        // Create URL
        guard let url = URL(string: baseURL + "/warehouse/articles") else { fatalError("Missing URL") }
        SharedLogger.shared().info("URL: \(url)")

        // Create Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"


        // Send Request
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                SharedLogger.shared().error("Request error: \(error)")
                DispatchQueue.main.async {
                    self.articlesLoading = false
                }
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let articlesResponse = try JSONDecoder().decode([Article].self, from: data)
                        self.articles = articlesResponse
                        self.articlesLoading = false
                    } catch let error {
                        SharedLogger.shared().error("Error decoding: \(error)")
                        self.articlesLoading = false
                    }
                }
            } else {
                SharedLogger.shared().error("Request error: \(response.statusCode)")
                DispatchQueue.main.async {
                    self.articlesLoading = false
                }
            }
        }

        dataTask.resume()
    }

    func getAvailabilityForArticles(articleNumbers: [String], _ completion: @escaping (([ArticleAvailability]) -> Void)) {
        articlesAvailabilityLoading = true
        // Create URL
        let urlString = baseURL + "/warehouse/articles/availability?articleNumbers=" + articleNumbers.joined(separator: ",")
        guard let url = URL(string: urlString) else { fatalError("Missing URL") }
        SharedLogger.shared().info("URL: \(url)")

        // Create Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        // Send Request
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                SharedLogger.shared().error("Request error: \(error)")
                DispatchQueue.main.async {
                    self.articlesAvailabilityLoading = false
                }
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let availabilities = try JSONDecoder().decode([ArticleAvailability].self, from: data)
                        completion(availabilities)
                        self.articlesAvailabilityLoading = false
                    } catch let error {
                        SharedLogger.shared().error("Error decoding: \(error)")
                        self.articlesAvailabilityLoading = false
                    }
                }
            } else {
                SharedLogger.shared().error("Request error: \(response.statusCode)")
                DispatchQueue.main.async {
                    self.articlesAvailabilityLoading = false
                }
            }
        }

        dataTask.resume()
    }
}
