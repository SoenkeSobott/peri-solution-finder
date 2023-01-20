//
//  ColumnFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 10.01.23.
//

import SwiftUI

struct ColumnFiltersView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State var lengthLowValue: CGFloat = 0
    @State var lengthHighValue: CGFloat = 500
    @State var widthLowValue: CGFloat = 0
    @State var widthHighValue: CGFloat = 500
    @State var heightLowValue: CGFloat = 0
    @State var heightHighValue: CGFloat = 1000
    
    var body: some View {
        VStack {
            HStack {
                Text(Structure.Column.rawValue)
                    .filterHeadlineStyle()
            }

            SliderView(lowValue: $lengthLowValue,
                       highValue: $lengthHighValue,
                       sliderHeader: "Lenght (CM)",
                       startValue: 0,
                       endValue: 500,
                       step: 50)
            .onChange(of: lengthLowValue) { _ in
                searchModel.columnLengthLowValue = lengthLowValue.rounded()
            }
            .onChange(of: lengthHighValue) { _ in
                searchModel.columnLengthHighValue = lengthHighValue.rounded()
            }

            SliderView(lowValue: $widthLowValue,
                       highValue: $widthHighValue,
                       sliderHeader: "Width (CM)",
                       startValue: 0,
                       endValue: 500,
                       step: 50)
            .onChange(of: widthLowValue) { _ in
                searchModel.columnWidthLowValue = widthLowValue.rounded()
            }
            .onChange(of: widthHighValue) { _ in
                searchModel.columnWidthHighValue = widthHighValue.rounded()
            }

            SliderView(lowValue: $heightLowValue,
                       highValue: $heightHighValue,
                       sliderHeader: "Height (CM)",
                       startValue: 0,
                       endValue: 1000,
                       step: 100)
            .onChange(of: heightLowValue) { _ in
                searchModel.columnHeightLowValue = heightLowValue.rounded()
            }
            .onChange(of: heightHighValue) { _ in
                searchModel.columnHeightHighValue = heightHighValue.rounded()
            }
        }
    }
}

struct ColumnFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnFiltersView()
            .environmentObject(SearchModel())
    }
}
