//
//  WallFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 03.01.23.
//

import SwiftUI
import RangeUISlider

struct WallFiltersView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State var thicknessLowValue: CGFloat = 0
    @State var thicknessHighValue: CGFloat = 600
    @State var heightLowValue: CGFloat = 100
    @State var heightHighValue: CGFloat = 900

    var body: some View {
        VStack {
            HStack {
                Text(Structure.Wall.rawValue)
                    .filterHeadlineStyle()
            }

            SliderView(lowValue: $thicknessLowValue,
                       highValue: $thicknessHighValue,
                       sliderHeader: "Thickness (CM)",
                       startValue: 0,
                       endValue: 600,
                       step: 100)
            .onChange(of: thicknessLowValue) { _ in
                searchModel.wallThicknessLowValue = thicknessLowValue.rounded()
            }
            .onChange(of: thicknessHighValue) { _ in
                searchModel.wallThicknessHighValue = thicknessHighValue.rounded()
            }

            SliderView(lowValue: $heightLowValue,
                       highValue: $heightHighValue,
                       sliderHeader: "Height (CM)",
                       startValue: 100,
                       endValue: 900,
                       step: 100)
            .onChange(of: heightLowValue) { _ in
                searchModel.wallHeightLowValue = heightLowValue.rounded()
            }
            .onChange(of: heightHighValue) { _ in
                searchModel.wallHeightHighValue = heightHighValue.rounded()
            }
        }
    }
}


struct WallFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        WallFiltersView()
            .environmentObject(SearchModel())
    }
}
