//
//  ShoringFilterView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 25.01.23.
//

import SwiftUI

struct ShoringFilterView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State var heightLowValue: CGFloat = 0
    @State var heightHighValue: CGFloat = 10
    @State var thicknessLowValue: CGFloat = 0
    @State var thicknessHighValue: CGFloat = 1000

    var body: some View {
        VStack {
            HStack {
                Text(Structure.Shoring.rawValue)
                    .filterHeadlineStyle()
            }

            SliderView(lowValue: $heightLowValue,
                       highValue: $heightHighValue,
                       sliderHeader: "Shoring Height (M)",
                       startValue: 0,
                       endValue: 10,
                       step: 1)
            .onChange(of: heightLowValue) { _ in
                searchModel.shoringHeightLowValue = heightLowValue.rounded()
            }
            .onChange(of: heightHighValue) { _ in
                searchModel.shoringHeightHighValue = heightHighValue.rounded()
            }

            SliderView(lowValue: $thicknessLowValue,
                       highValue: $thicknessHighValue,
                       sliderHeader: "Slab Thickness (CM)",
                       startValue: 0,
                       endValue: 1000,
                       step: 100)
            .onChange(of: thicknessLowValue) { _ in
                searchModel.shoringThicknessLowValue = thicknessLowValue.rounded()
            }
            .onChange(of: thicknessHighValue) { _ in
                searchModel.shoringThicknessHighValue = thicknessHighValue.rounded()
            }
        }
    }
}

struct ShoringFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ShoringFilterView()
            .environmentObject(SearchModel())
    }
}
