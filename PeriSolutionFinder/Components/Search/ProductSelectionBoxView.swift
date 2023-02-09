//
//  ProductSelectionBoxView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct ProductSelectionBoxView: View {
    @EnvironmentObject var searchModel: SearchModel

    private let outerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.425
    private let outerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.5
    private let outerBoxCornerRadius: CGFloat = 18

    private let innerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.38
    private let innerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.35
    private let innerBoxCornerRadius: CGFloat = 10

    let product: Product

    private func outerToInnerBoxPadding() -> CGFloat {
        return (outerBoxWidth - innerBoxWidth)/2
    }

    private func isSelected() -> Bool {
        return searchModel.selectedProduct == product
    }

    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: outerBoxCornerRadius)
                    .fill(isSelected() ? Color("PeriRed").opacity(0.1) : Color("PeriLightGray"))
            }
            .frame(width: outerBoxWidth, height: outerBoxHeight)

            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: innerBoxCornerRadius)
                        .fill(.white)
                        .frame(width: innerBoxWidth, height: innerBoxHeight)
                        .grayViewShadow()

                    Image(getImageNameForProduct(product: product))
                        .resizable()
                        .scaledToFit()
                        .frame(height: innerBoxHeight)
                }
                .padding(.top, outerToInnerBoxPadding())

                Spacer()

                HStack() {
                    Text(product.rawValue)
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
                searchModel.selectedProduct = product
            } else {
                searchModel.selectedProduct = nil
            }
        }
    }

    private func getImageNameForProduct(product: Product) -> String {
        switch product {
        case .DUO:
            return "duo-imperial-sized-column"
        case .PS100:
            return "ps100"
        }
    }
}

struct ProductSelectionBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSelectionBoxView(product: .PS100)
            .environmentObject(SearchModel())
    }
}
