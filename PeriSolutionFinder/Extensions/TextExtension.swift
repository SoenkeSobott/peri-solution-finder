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

    func searchCriteriaPillStyle(isSelected: Bool) -> some View {
        self.foregroundColor(isSelected ? Color("PeriRed") : .gray)
            .frame(width: UIScreen.main.bounds.width*0.4, height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(isSelected ? Color("PeriRed") : .gray, lineWidth: 2)
            )
            .background(Color.white)
            .cornerRadius(50)
    }
}
