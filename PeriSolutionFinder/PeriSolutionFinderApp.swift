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

    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .environmentObject(network)
        }
    }
}
