//
//  ImageExtensions.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.01.23.
//

import SwiftUI

extension Image {

    func dropdownChevron(isSelected: Bool, isFilterSet: Bool) -> some View {
        self.resizable()
            .foregroundColor(isFilterSet ? .white : (isSelected ? Color("PeriRed") : .gray))
            .frame(width: 25, height: 25)
            .padding(.trailing, 7.5)
    }

}
