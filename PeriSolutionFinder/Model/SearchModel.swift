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
    @Published var structureElements: [Structure] = [Structure.Wall, Structure.Column, Structure.Slab, Structure.Culvert, Structure.Tank]
    @Published var selectedStructure: Structure = Structure.Wall
    @Published var segmentElements: [Segment] = [Segment.Residential, Segment.NonResidential, Segment.Infrastrucutre, Segment.Industrial]
    @Published var selectedSegment: Segment = Segment.Infrastrucutre


    // FilterValues
    @Published var searchTerm: String = ""
    @Published private var thicknessLowValue: CGFloat?
    @Published private var thicknessHighValue: CGFloat?
    @Published private var heightLowValue: CGFloat?
    @Published private var heightHighValue: CGFloat?

    func getSelectedProduct() -> Product? {
        return selectedProduct
    }

    func setSelectedProduct(product: Product?) {
        self.selectedProduct = product
    }

    func getThicknessLowValue() -> CGFloat? {
        return thicknessLowValue
    }

    func setThicknessLowValue(thickness: CGFloat?) {
        self.thicknessLowValue = thickness
    }

    func getThicknessHighValue() -> CGFloat? {
        return thicknessHighValue
    }

    func setThicknessHighValue(thickness: CGFloat?) {
        self.thicknessHighValue = thickness
    }

    func getHeightLowValue() -> CGFloat? {
        return heightLowValue
    }

    func setHeightLowValue(height: CGFloat?) {
        self.heightLowValue = height
    }

    func getHeightHighValue() -> CGFloat? {
        return heightHighValue
    }

    func setHeightHighValue(height: CGFloat?) {
        self.heightHighValue = height
    }
}
