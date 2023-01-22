//
//  CulvertFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.01.23.
//

import SwiftUI

struct CulvertFiltersView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State var thicknessLowValue: CGFloat = 0
    @State var thicknessHighValue: CGFloat = 250
    @State var heightLowValue: CGFloat = 50
    @State var heightHighValue: CGFloat = 500

    var body: some View {
        VStack {
            HStack {
                Text(Structure.Culvert.rawValue)
                    .filterHeadlineStyle()
            }

            SliderView(lowValue: $thicknessLowValue,
                       highValue: $thicknessHighValue,
                       sliderHeader: "Thickness (CM)",
                       startValue: 0,
                       endValue: 250,
                       step: 25)
            .onChange(of: thicknessLowValue) { _ in
                searchModel.culvertThicknessLowValue = thicknessLowValue.rounded()
            }
            .onChange(of: thicknessHighValue) { _ in
                searchModel.culvertThicknessHighValue = thicknessHighValue.rounded()
            }

            SliderView(lowValue: $heightLowValue,
                       highValue: $heightHighValue,
                       sliderHeader: "Height (CM)",
                       startValue: 50,
                       endValue: 500,
                       step: 50)
            .onChange(of: heightLowValue) { _ in
                searchModel.culvertHeightLowValue = heightLowValue.rounded()
            }
            .onChange(of: heightHighValue) { _ in
                searchModel.culvertHeightHighValue = heightHighValue.rounded()
            }
        }
    }
}

struct CulvertFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        CulvertFiltersView()
            .environmentObject(SearchModel())
    }
}
