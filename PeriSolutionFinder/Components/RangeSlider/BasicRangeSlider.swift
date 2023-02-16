//
//  Slider.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 14.02.23.
//

import SwiftUI

struct BasicRangeSlider: View {
    @StateObject private var model: BasicRangeSliderModel = BasicRangeSliderModel()
    @State private var initialMinValue: Float = 0
    @State private var initialMaxValue: Float = 100
    @Binding var minValue: Float
    @Binding var maxValue: Float
    let totalWidth: CGFloat
    let entries: [Float]

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(0...model.amountOfIndicators-1, id: \.self) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(model.isIndicatorSelected(indicatorIndex: $0) ? Color("PeriRed") : .gray.opacity(0.2))
                        .frame(height: model.calcIndicatorHeight(indicator: $0, entries: entries))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(width: totalWidth)
            .offset(y: (model.knobWidth/2)-(model.height/2))

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.2))
                    .frame(width: totalWidth, height: model.height)

                Rectangle()
                    .fill(Color("PeriRed"))
                    .frame(width: model.calcMaxWidth(totalWidth: totalWidth) - model.calcMinWidth(totalWidth: totalWidth), height: model.height)
                    .offset(x: model.calcMinWidth(totalWidth: totalWidth) + model.knobWidth)

                HStack(spacing: 0) {
                    Circle()
                        .fill(.white)
                        .frame(width: model.knobWidth, height: model.knobWidth)
                        .grayViewShadow()
                        .offset(x: model.calcMinWidth(totalWidth: totalWidth))
                        .gesture(
                            DragGesture().onChanged({ value in
                                let x = value.location.x
                                if (x >= -(model.knobWidth/2) && x <= model.calcMaxWidth(totalWidth: totalWidth)) {
                                    model.min = model.calcMinValue(x: x, totalWidth: totalWidth)
                                }
                            })
                        )

                    Circle()
                        .fill(.white)
                        .frame(width: model.knobWidth, height: model.knobWidth)
                        .grayViewShadow()
                        .offset(x: model.calcMaxWidth(totalWidth: totalWidth))
                        .gesture(
                            DragGesture().onChanged({ value in
                                let x = value.location.x
                                if (x <= model.getWidth(totalWidth: totalWidth) && x >= model.calcMinWidth(totalWidth: totalWidth)) {
                                    model.max = model.calcMaxValue(x: x, totalWidth: totalWidth)
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
            if (!entries.isEmpty) {
                let sortedEntries = entries.sorted()
                self.initialMinValue = sortedEntries.first!
                self.initialMaxValue = sortedEntries.last!
                minValue = initialMinValue
                maxValue = initialMaxValue
            } else {
                SharedLogger.shared().error("Entries empty: \(entries)")
            }

        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        BasicRangeSlider(minValue: .constant(0),
                         maxValue: .constant(100),
                         totalWidth: UIScreen.main.bounds.width*0.7,
                         entries: [-20, 6, 9, 9, 9, 8, 8, 9, 10, 23, 33, 40, 45, 34, 35, 35, 35, 35, 36, 37, 37, 60, 70, 85, 100, 180, 181, 181, 182, 183, 185, 200, 300, 310, 310, 310, 310, 3, 360, 420])
    }
}
