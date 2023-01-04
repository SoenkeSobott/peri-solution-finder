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

    func searchCriteriaPillStyle(isSelected: Bool, height: CGFloat) -> some View {
        self.foregroundColor(isSelected ? Color("PeriRed") : .gray)
            .frame(width: UIScreen.main.bounds.width*0.4, height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(isSelected ? Color("PeriRed") : .gray, lineWidth: 2)
            )
            .font(Font.system(size: 12, weight: .bold))
            .background(Color.white)
            .cornerRadius(50)
    }

    func filterHeadingStyle() -> some View {
        self.foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .font(Font.system(size: 22, weight: .medium, design: .default))
            .padding(.bottom, 0)
            .padding(.leading, UIScreen.main.bounds.width*0.05)
            .padding(.trailing, UIScreen.main.bounds.width*0.05)
    }
}
