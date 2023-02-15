//
//  Slider.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 14.02.23.
//

import SwiftUI

struct BasicRangeSlider: View {
    @StateObject var model: BasicRangeSliderModel
    @Binding var initialMinValue: Float
    @Binding var initialMaxValue: Float
    @Binding var minValue: Float
    @Binding var maxValue: Float

    // Definitions
    private let screenWidth: CGFloat = UIScreen.main.bounds.width

    var body: some View {
        VStack(spacing: 0) {

            HStack(alignment: .bottom, spacing: 8) {
                ForEach(0...model.amountOfIndicators-1, id: \.self) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(model.isIndicatorSelected(indicatorIndex: $0) ? Color("PeriRed") : .gray.opacity(0.2))
                        .frame(height: model.calcIndicatorHeight(indicator: $0))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(width: model.totalWidth)
            .offset(y: (model.knobWidth/2)-(model.height/2))

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.2))
                    .frame(width: model.totalWidth, height: model.height)

                Rectangle()
                    .fill(Color("PeriRed"))
                    .frame(width: model.calcMaxWidth() - model.calcMinWidth(), height: model.height)
                    .offset(x: model.calcMinWidth() + model.knobWidth)

                HStack(spacing: 0) {
                    Circle()
                        .fill(.white)
                        .frame(width: model.knobWidth, height: model.knobWidth)
                        .grayViewShadow()
                        .offset(x: model.calcMinWidth())
                        .gesture(
                            DragGesture().onChanged({ value in
                                let x = value.location.x
                                if (x >= -(model.knobWidth/2) && x <= model.calcMaxWidth()) {
                                    model.min = model.calcMinValue(x: x)
                                }
                            })
                        )

                    Circle()
                        .fill(.white)
                        .frame(width: model.knobWidth, height: model.knobWidth)
                        .grayViewShadow()
                        .offset(x: model.calcMaxWidth())
                        .gesture(
                            DragGesture().onChanged({ value in
                                let x = value.location.x
                                if (x <= model.getWidth() && x >= model.calcMinWidth()) {
                                    model.max = model.calcMaxValue(x: x)
                                }
                            })
                        )
                }
            }
        }
        .onChange(of: model.min) { newMin in
            if (newMin < 0.02) {
                minValue = initialMinValue
                model.min = 0
            } else {
                let spaceBetween = initialMaxValue-initialMinValue
                minValue = initialMinValue+(spaceBetween*newMin)
            }
        }
        .onChange(of: model.max) { newMax in
            if (newMax > 0.98) {
                maxValue = initialMaxValue
                model.max = 1
            } else {
                let spaceBetween = initialMaxValue-initialMinValue
                maxValue = initialMinValue+(spaceBetween*newMax)
            }
        }
        .onAppear {
            minValue = initialMinValue
            maxValue = initialMaxValue
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        let model = BasicRangeSliderModel(totalWidth: UIScreen.main.bounds.width*0.7,
                                          entries: [2, 4, 6, 7, 8, 8, 9, 10, 23, 33, 40, 45, 34, 35, 35, 35, 35, 36, 37, 37, 60, 70, 85, 100, 180, 181, 181, 182, 183, 185, 200, 300, 310, 310, 310, 310, 3, 360, 420])
        BasicRangeSlider(model: model,
                         initialMinValue: .constant(0),
                         initialMaxValue: .constant((100)),
                         minValue: .constant(0),
                         maxValue: .constant(100))
    }
}
