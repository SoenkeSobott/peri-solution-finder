//
//  SearchModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 29.12.22.
//

import SwiftUI

class SearchModel: ObservableObject {
    let identifier = UUID()

    @Published private var selectedProduct: Product?
    @Published var selectedCriteria: SearchCriteria = SearchCriteria.Product
    @Published var structureElements: [Structure] = [Structure.Wall, Structure.Column, Structure.Slob]
    @Published var selectedStructure: Structure = Structure.Wall

    // FilterValues
    @Published var searchTerm: String = ""
    @Published var thickness: Double = 10
    @Published var height: Double = 100

    func getSelectedProduct() -> Product? {
        return selectedProduct
    }

    func setSelectedProduct(product: Product?) {
        self.selectedProduct = product
        updateSearchTerm()
    }

    private func updateSearchTerm() {
        if (selectedProduct != nil) {
            searchTerm = selectedProduct!.rawValue
        } else if (selectedProduct == nil) {
            searchTerm = ""
        }
    }
}

