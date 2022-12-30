//
//  SliderView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
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

    func isStepSelected(currentValue: Double) -> Bool {
        return currentValue == sliderValue
    }

    func divisionValue() -> CGFloat {
        return CGFloat(endValue/step)
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
                                        .fontWeight(isStepSelected(currentValue: value) ? .bold : .light)
                                    Image(systemName: "capsule.portrait.fill")
                                        .resizable()
                                        .frame(width: 5, height: 8)
                                        .foregroundColor(Color("PeriRed"))
                                }
                            }
                        }
                        .frame(width: innerBoxWidth-30)

                        Slider(value: $sliderValue, in: startValue...endValue, step: step)
                            .frame(width: innerBoxWidth-30)
                            .accentColor(Color("PeriRed"))
                    }
                }
            }
        }
        .frame(width: outerBoxWidth, height: outerBoxHeight)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(10),
                   sliderHeader: "Thickness (CM)",
                   startValue: 10,
                   endValue: 100,
                   step: 10)
    }
}
