//
//  ProductSelectionBoxView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct ProductSelectionBoxView: View {
    @EnvironmentObject var searchModel: SearchModel

    private let outerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.4
    private let outerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.45
    private let outerBoxCornerRadius: CGFloat = 20

    private let innerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.35
    private let innerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.32
    private let innerBoxCornerRadius: CGFloat = 10

    private func outerToInnerBoxPadding() -> CGFloat {
        return (outerBoxWidth - innerBoxWidth)/2
    }

    private func isSelected() -> Bool {
        return searchModel.getSelectedProduct() == Product.Duo
    }

    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: outerBoxCornerRadius)
                    .fill(isSelected() ? Color("PeriRed").opacity(0.1) : Color("PeriLightGray"))
                    .shadow(color: .gray.opacity(isSelected() ? 0.5 : 0), radius: 10)
            }
            .frame(width: outerBoxWidth, height: outerBoxHeight)

            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: innerBoxCornerRadius)
                        .fill(.white)
                        .frame(width: innerBoxWidth, height: innerBoxHeight)
                        .shadow(color: .gray.opacity(0.1), radius: 5, y: 5)

                    Image("duo-imperial-sized-column")
                        .resizable()
                        .scaledToFit()
                        .frame(height: innerBoxHeight)
                }
                .padding(.top, outerToInnerBoxPadding())

                Spacer()

                HStack() {
                    Text("DUO")
                        .headlineThree()
                        .multilineTextAlignment(.leading)
                        .padding(.leading, outerToInnerBoxPadding()+innerBoxCornerRadius)

                    Spacer()
                }
                .frame(width: outerBoxWidth)

                Spacer()
            }
            .frame(width: outerBoxWidth, height: outerBoxHeight)
        }
        .onTapGesture {
            if (!isSelected()) {
                searchModel.setSelectedProduct(product: Product.Duo)
            } else {
                searchModel.setSelectedProduct(product: nil)
            }
        }
    }
}

struct ProductSelectionBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSelectionBoxView()
            .environmentObject(SearchModel())
    }
}
