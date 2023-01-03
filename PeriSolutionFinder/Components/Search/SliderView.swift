//
//  SliderView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI
import RangeUISlider

struct SliderView: View {
    @EnvironmentObject var searchModel: SearchModel

    @Binding var lowValue: CGFloat
    @Binding var highValue: CGFloat
    var sliderHeader: String
    var startValue: Double
    var endValue: Double
    var step: Double

    private let outerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.9
    private let outerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.35

    private let innerBoxWidth: CGFloat = UIScreen.main.bounds.width*0.85
    private let innerBoxHeight: CGFloat = UIScreen.main.bounds.width*0.2

    private func outerToInnerBoxPadding() -> CGFloat {
        return (outerBoxWidth-innerBoxWidth)/2
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("PeriLightGray"))
                .frame(width: outerBoxWidth, height: outerBoxHeight)

            VStack(alignment: .center) {
                Spacer()

                HStack() {
                    Text(sliderHeader)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                        .padding(.leading, outerToInnerBoxPadding())
                    Spacer()
                }
                .frame(width: outerBoxWidth)

                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(width: innerBoxWidth, height: innerBoxHeight)
                        .padding(.bottom, outerToInnerBoxPadding())
                        .shadow(color: .gray.opacity(0.1), radius: 5)

                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            ForEach(Array(stride(from: startValue, to: endValue+step, by: step)), id: \.self) { value in
                                VStack(alignment: .center) {
                                    Text(Int(value).description)
                                        .font(Font.system(size: 12))
                                        .fixedSize(horizontal: true, vertical: false)
                                        .frame(maxWidth: .infinity)
                                    Image(systemName: "capsule.portrait.fill")
                                        .resizable()
                                        .frame(width: 5, height: 8)
                                        .foregroundColor(Color("PeriRed"))
                                }
                            }
                        }
                        .frame(width: innerBoxWidth-30)

                        RangeSlider(minValueSelected: $lowValue, maxValueSelected: $highValue)
                            .scaleMinValue(0)
                            .scaleMaxValue(1)
                            .stepIncrement(0.1)
                            .rangeSelectedColor(Color("PeriRed"))
                            .rangeNotSelectedColor(.gray.opacity(0.3))
                            .barHeight(4)
                            .leftKnobColor(.white)
                            .leftKnobWidth(30)
                            .leftKnobHeight(30)
                            .leftKnobCorners(15)
                            .leftShadowColor(.black)
                            .leftShadowOpacity(0.2)
                            .leftShadowRadius(5)
                            .leftShadowOffset(CGSize(width: 0, height: 0))
                            .rightKnobColor(.white)
                            .rightKnobWidth(30)
                            .rightKnobHeight(30)
                            .rightKnobCorners(15)
                            .rightShadowColor(.black)
                            .rightShadowOpacity(0.2)
                            .rightShadowRadius(5)
                            .rightShadowOffset(CGSize(width: 0, height: 0))
                            .frame(width: innerBoxWidth-10, height: 30)
                            .padding(.top, 5)
                    }
                }
            }
        }
        .frame(width: outerBoxWidth, height: outerBoxHeight)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(lowValue: .constant(0),
                   highValue: .constant(1),
                   sliderHeader: "Thickness (CM)",
                   startValue: 0,
                   endValue: 100,
                   step: 10)
    }
}
