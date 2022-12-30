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
    @Published var thickness: Double?
    @Published var height: Double?

    func getSelectedProduct() -> Product? {
        return selectedProduct
    }

    func setSelectedProduct(product: Product?) {
        self.selectedProduct = product
        updateSearchTerm()
    }

    func getThickness() -> Double? {
        return thickness
    }

    func setThickness(thickness: Double?) {
        self.thickness = thickness
    }

    func getHeight() -> Double? {
        return height
    }

    func setHeight(height: Double?) {
        self.height = height
    }

    func updateSearchTerm() {
        // Product
        if (selectedProduct != nil) {
            searchTerm = selectedProduct!.rawValue
        } else if (selectedProduct == nil) {
            searchTerm = ""
        }

        // Thickness
        if (thickness != nil && thickness! > 0) {
            searchTerm+=thickness!.description
        }

        // Height
        if (height != nil && height! > 0) {
            searchTerm+=height!.description
        }

    }
}

