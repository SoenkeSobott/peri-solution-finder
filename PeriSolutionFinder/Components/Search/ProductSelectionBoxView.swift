//
//  ProductSelectionBoxView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct ProductSelectionBoxView: View {

    private let outerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.4
    private let outerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.45

    private let innerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.35
    private let innerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.32

    private func outerToInnerBoxPadding() -> CGFloat {
        return (outerBoxWidth - innerBoxWidth)/2
    }

    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("PeriLightGray"))
                .frame(width: outerBoxWidth, height: outerBoxHeight)

            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
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
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                        .padding(.leading, outerToInnerBoxPadding())

                    Spacer()
                }
                .frame(width: outerBoxWidth)

                Spacer()
            }
            .frame(width: outerBoxWidth, height: outerBoxHeight)
        }
    }
}

struct ProductSelectionBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSelectionBoxView()
    }
}
