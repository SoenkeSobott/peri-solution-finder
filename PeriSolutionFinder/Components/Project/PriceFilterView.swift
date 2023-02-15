//
//  PriceFilterView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 14.02.23.
//

import SwiftUI
import RangeUISlider

struct PriceFilterView: View {
    @EnvironmentObject var network: Network
    @StateObject var priceFilterModel: PriceFilterModel
    @Binding var minValue: Float
    @Binding var maxValue: Float

    var body: some View {
        VStack {
            HStack {
                Text("Price Range ($)")
                    .headlineTwo()
                Spacer()
            }
            .padding(.bottom, 10)

            HStack {
                VStack(alignment: .center) {
                    Text(formatNumber(number: priceFilterModel.startValue))
                        .text()
                    Text("Min")
                        .text()
                        .opacity(0.5)
                    Image(systemName: "capsule.portrait.fill")
                        .resizable()
                        .frame(width: 5, height: 8)
                        .foregroundColor(Color("PeriRed"))
                }
                .frame(width: UIScreen.main.bounds.width*0.2)

                Spacer()

                VStack(alignment: .center) {
                    Text(formatNumber(number: priceFilterModel.median))
                        .text()
                    Text("Median")
                        .text()
                        .opacity(0.5)
                    Image(systemName: "capsule.portrait.fill")
                        .resizable()
                        .frame(width: 5, height: 8)
                        .foregroundColor(Color("PeriRed"))
                }
                .frame(width: UIScreen.main.bounds.width*0.2)

                Spacer()

                VStack(alignment: .center) {
                    Text(formatNumber(number: priceFilterModel.endValue))
                        .text()
                    Text("Max")
                        .text()
                        .opacity(0.5)
                    Image(systemName: "capsule.portrait.fill")
                        .resizable()
                        .frame(width: 5, height: 8)
                        .foregroundColor(Color("PeriRed"))
                }
                .frame(width: UIScreen.main.bounds.width*0.2)
            }

            Text("Min: \(String(format: "%.2f", minValue)) Max: \(String(format: "%.2f", maxValue))")

            BasicRangeSlider(model: BasicRangeSliderModel(
                totalWidth: UIScreen.main.bounds.width*0.7, entries: network.projects.map { $0.projectPricePerUnit ?? 0 }),
                             initialMinValue: $priceFilterModel.startValue,
                            initialMaxValue: $priceFilterModel.endValue,
                            minValue: $minValue, maxValue: $maxValue)
                .padding()

        }
        .frame(width: UIScreen.main.bounds.width*0.9)
    }
}

struct PriceFilterView_Previews: PreviewProvider {
    static var previews: some View {
        let network = Network()
        PriceFilterView(priceFilterModel: PriceFilterModel(), minValue: .constant(0), maxValue: .constant(1))
            .environmentObject(network)
    }
}
