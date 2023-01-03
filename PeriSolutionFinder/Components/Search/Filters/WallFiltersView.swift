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
                Text("Wall")
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .font(Font.system(size: 22, weight: .medium, design: .default))
                    .padding(.bottom, 0)
                    .padding(.leading, UIScreen.main.bounds.width*0.05)
                    .padding(.trailing, UIScreen.main.bounds.width*0.05)

                Button(action: {
                    searchModel.setThicknessLowValue(thickness: -1)
                    searchModel.setThicknessHighValue(thickness: -1)
                    searchModel.setHeightLowValue(height: -1)
                    searchModel.setHeightHighValue(height: -1)
                    searchModel.updateSearchTerm()
                }, label: {
                    Text("Reset")
                        .padding(.trailing, UIScreen.main.bounds.width*0.05)
                })
            }

            SliderView(lowValue: $thicknessLowValue,
                       highValue: $thicknessHighValue,
                       sliderHeader: "Thickness (CM)",
                       startValue: 0,
                       endValue: 100,
                       step: 10)

            SliderView(lowValue: $heightLowValue,
                       highValue: $heightHighValue,
                       sliderHeader: "Height (CM)",
                       startValue: 0,
                       endValue: 1000,
                       step: 100)

            Button(action: {
                searchModel.setThicknessLowValue(thickness: thicknessLowValue.rounded())
                searchModel.setThicknessHighValue(thickness: thicknessHighValue.rounded())
                searchModel.setHeightLowValue(height: heightLowValue.rounded())
                searchModel.setHeightHighValue(height: heightHighValue.rounded())
                searchModel.updateSearchTerm()
            }, label: {
                Text("Add to Search")
                    .foregroundColor(Color("PeriRed"))
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: 40)
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
