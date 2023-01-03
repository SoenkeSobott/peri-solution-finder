//
//  ProductFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 03.01.23.
//

import SwiftUI

struct ProductFiltersView: View {
    var body: some View {
        VStack {
            Text("Search by Name")
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .font(Font.system(size: 22, weight: .medium, design: .default))
                .padding(.bottom, 0)
                .padding(.leading, UIScreen.main.bounds.width*0.05)
                .padding(.trailing, UIScreen.main.bounds.width*0.05)

            HStack {
                ProductSelectionBoxView()
                    .padding(.leading, UIScreen.main.bounds.width*0.05)
                Spacer()
            }
        }    }
}

struct ProductFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFiltersView()
    }
}
