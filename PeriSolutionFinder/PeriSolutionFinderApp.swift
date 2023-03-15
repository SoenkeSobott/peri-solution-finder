//
//  PeriSolutionFinderApp.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 10.11.22.
//

import SwiftUI

@main
struct PeriSolutionFinderApp: App {
    var network = Network()
    @StateObject var searchModel = SearchModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(network)
                .environmentObject(searchModel)
        }
    }
}
