//
//  BasicRangeSliderModel.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 15.02.23.
//

import Foundation

class BasicRangeSliderModel: ObservableObject {
    @Published var min: Float = 0
    @Published var max: Float = 1
    let height: CGFloat = 5
    let amountOfIndicators: Int = 20
    let knobWidth: CGFloat = 30

    func getWidth(totalWidth: CGFloat) -> Double {
        let width = (knobWidth+15)
        return (totalWidth-width)
    }

    func calcMinWidth(totalWidth: CGFloat) -> CGFloat {
        let val = min.toCGFloat()*totalWidth
        return val-15
    }

    func calcMaxWidth(totalWidth: CGFloat) -> CGFloat {
        let val = max.toCGFloat()*totalWidth
        return val-45
    }

    func calcMinValue(x: CGFloat, totalWidth: CGFloat) -> Float {
        let val = (x+15)/totalWidth
        return val.toFloat()
    }

    func calcMaxValue(x: CGFloat, totalWidth: CGFloat) -> Float {
        let val = (x+45)/totalWidth
        return val.toFloat()
    }

    func calcIndicatorHeight(indicator: Int, entries: [Float]) -> CGFloat {
        let minEntry = entries.sorted().first!
        let maxEntry = entries.sorted().last!
        let range = maxEntry-minEntry
        let partOfRange = range/Float(amountOfIndicators)


        var valuesBetweenPartsOfRange: [Int] = []
        var amountValuesBetweenPartOfRangeForIndicator: Int = 0
        for indicatorIndex in 0...amountOfIndicators-1 {
            let minRange = minEntry+(partOfRange*Float(indicatorIndex))
            let maxRange = minEntry+(partOfRange*(Float(indicatorIndex+1)))
            let valuesBetween = entries.filter {
                $0 >= minRange && $0 <= maxRange // This can produce anamolies -> value can be in both
            }
            valuesBetweenPartsOfRange.append(valuesBetween.count)
            if (indicatorIndex == indicator) {
                amountValuesBetweenPartOfRangeForIndicator = valuesBetween.count
            }
        }
        let maxInBetweens = valuesBetweenPartsOfRange.sorted().last!

        if amountValuesBetweenPartOfRangeForIndicator != 0 {
            return ((Float(amountValuesBetweenPartOfRangeForIndicator)/Float(maxInBetweens))*50).toCGFloat()
        }
        return 0
    }

    func isIndicatorSelected(indicatorIndex: Int) -> Bool {
        let minKnob = min
        let maxKnob = max
        let indicatorPosition = (Float(indicatorIndex)/Float(amountOfIndicators))+0.025
        return minKnob <= indicatorPosition && indicatorPosition <= maxKnob
    }

}
