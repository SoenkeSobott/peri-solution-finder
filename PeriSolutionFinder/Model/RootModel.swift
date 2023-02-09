//
//  RootModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import Foundation

class RootModel: ObservableObject {
    @Published var shouldLoadArticles: Bool = true
    @Published var selectedIndex: Int = 0
}
