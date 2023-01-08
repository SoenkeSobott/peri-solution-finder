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
    @State var thicknessHighValue: CGFloat = 100
    @State var heightLowValue: CGFloat = 0
    @State var heightHighValue: CGFloat = 1000
    @State var height: Double = -1

    var body: some View {
        VStack {
            HStack {
                Text(Structure.Wall.rawValue)
                    .filterHeadingStyle()
            }

            SliderView(lowValue: $thicknessLowValue,
                       highValue: $thicknessHighValue,
                       sliderHeader: "Thickness (CM)",
                       startValue: 0,
                       endValue: 100,
                       step: 10)
            .onChange(of: thicknessLowValue) { _ in
                searchModel.setThicknessLowValue(thickness: thicknessLowValue)
            }
            .onChange(of: thicknessHighValue) { _ in
                searchModel.setThicknessHighValue(thickness: thicknessHighValue)
            }

            SliderView(lowValue: $heightLowValue,
                       highValue: $heightHighValue,
                       sliderHeader: "Height (CM)",
                       startValue: 0,
                       endValue: 1000,
                       step: 100)
            .onChange(of: heightLowValue) { _ in
                searchModel.setHeightLowValue(height: heightLowValue)
            }
            .onChange(of: heightHighValue) { _ in
                searchModel.setHeightHighValue(height: heightHighValue)
            }

            Button(action: {
                searchModel.setThicknessLowValue(thickness: 0)
                searchModel.setThicknessHighValue(thickness: 100)
                searchModel.setHeightLowValue(height: 0)
                searchModel.setHeightHighValue(height: 1000)
            }, label: {
                Text("Reset")
                    .foregroundColor(Color("PeriRed"))
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width*0.5, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color("PeriRed"), lineWidth: 3)
                    )
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color("PeriRed").opacity(0.2), radius: 10, y: 5)
                    .padding(.bottom, 20)
            })
        }
    }
}


struct WallFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        WallFiltersView()
            .environmentObject(SearchModel())
    }
}
