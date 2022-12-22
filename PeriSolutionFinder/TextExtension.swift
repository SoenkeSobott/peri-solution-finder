//
//  TextExtension.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI

extension Text {
    func redBackgroundWithRoundedCorners(isSelected: Bool) -> some View {
        self.padding(.leading, 20)
            .padding(.trailing, 20)
            .frame(height: 50)
            .background(isSelected ? Color("PeriRed") : Color.clear)
            .cornerRadius(25)
            .fontWeight(.bold)
            .foregroundColor(isSelected ? Color.white : Color.gray)
    }
}
