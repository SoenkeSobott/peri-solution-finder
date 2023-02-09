//
//  TextExtension.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI

extension Text {
    func redBackgroundWithRoundedCorners(isSelected: Bool) -> some View {
        self.headlineThree()
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .frame(height: 50)
            .background(isSelected ? Color("PeriRed") : Color.clear)
            .cornerRadius(25)
            .foregroundColor(isSelected ? Color.white : Color.gray)
            .redViewShadow(selected: isSelected)
            .scaledToFill()
            .minimumScaleFactor(0.8)
            .lineLimit(1)
    }

    func searchCriteriaPillStyle(isSelected: Bool, isFilterSet: Bool, height: CGFloat) -> some View {
        self.text()
            .foregroundColor(getForegroundColorForFilterPills(isSelected: isSelected, isFilterSet: isFilterSet))
            .frame(width: UIScreen.main.bounds.width*0.4, height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(isSelectedOrIsFilterSet(isSelected: isSelected, isFilterSet: isFilterSet) ? Color("PeriRed") : .gray, lineWidth: 2)
            )
            .overlay(
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25, alignment: .center)
                        .padding(.leading, 7.5)
                        .foregroundColor(.white)
                        .opacity(isFilterSet ? 1 : 0)
                    Spacer()
                }
            )
            .background(isFilterSet ? Color("PeriRed") : Color.white)
            .cornerRadius(50)
    }

    func filterHeadlineStyle() -> some View {
        self.headlineOne()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 0)
    }

    func headline() -> some View {
        self.font(Font.system(size: 22, weight: .bold, design: .default))
            .foregroundColor(Color.black)
    }

    func headlineOne() -> some View {
        self.font(Font.system(size: 20, weight: .bold, design: .default))
    }

    func headlineTwo() -> some View {
        self.font(Font.system(size: 16, weight: .bold, design: .default))
    }

    func headlineThree() -> some View {
        self.font(Font.system(size: 14, weight: .semibold, design: .default))
    }

    func text() -> some View {
        self.font(Font.system(size: 13, weight: .medium, design: .default))
    }

    // Helper functions

    func getForegroundColorForFilterPills(isSelected: Bool, isFilterSet: Bool) -> Color {
        if (isFilterSet) {
            return .white
        } else if (isSelected) {
            return Color("PeriRed")
        }
        return .gray
    }

    func isSelectedOrIsFilterSet(isSelected: Bool, isFilterSet: Bool) -> Bool {
        return (isSelected || isFilterSet)
    }
}
