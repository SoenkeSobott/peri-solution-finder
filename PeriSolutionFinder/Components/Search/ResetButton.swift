//
//  ResetButton.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 15.01.23.
//

import SwiftUI

struct ResetButton: View {
    @EnvironmentObject var searchModel: SearchModel

    var body: some View {
        Button(action: {
            searchModel.resetAllFilters()
            searchModel.selectedCriteria = .Product
        }, label: {
            Text("Reset All")
                .headlineTwo()
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width*0.5, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.gray, lineWidth: 3)
                )
                .background(Color.white)
                .cornerRadius(50)
                .grayViewShadow()
        })
        .disabled(!searchModel.hasSelectedItems())
    }
}

struct ResetButton_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton()
            .environmentObject(SearchModel())
    }
}
