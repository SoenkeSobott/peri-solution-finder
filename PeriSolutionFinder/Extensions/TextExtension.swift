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

    func searchCriteriaPillStyle(isSelected: Bool, isFilterSet: Bool, height: CGFloat) -> some View {
        self.foregroundColor(getForegroundColorForFilterPills(isSelected: isSelected, isFilterSet: isFilterSet))
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
            .font(Font.system(size: 12, weight: .bold))
            .background(isFilterSet ? Color("PeriRed") : Color.white)
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
