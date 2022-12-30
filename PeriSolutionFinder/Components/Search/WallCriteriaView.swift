//
//  WallCriteriaView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct WallCriteriaView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State var thickness: Double = -1
    @State var height: Double = -1

    var body: some View {
        VStack {
            SliderView(sliderValue: $thickness,
                       sliderHeader: "Thickness (CM)",
                       startValue: 10,
                       endValue: 100,
                       step: 10)
            .onAppear {
                if (searchModel.thickness != nil) {
                    thickness = searchModel.thickness!
                }
            }
            SliderView(sliderValue: $height,
                       sliderHeader: "Height (CM)",
                       startValue: 100,
                       endValue: 1000,
                       step: 100)
            .onAppear {
                if (searchModel.height != nil) {
                    height = searchModel.height!
                }
            }

            Button(action: {
                searchModel.setThickness(thickness: thickness)
                searchModel.setHeight(height: height)
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

struct WallCriteriaView_Previews: PreviewProvider {
    static var previews: some View {
        WallCriteriaView()
            .environmentObject(SearchModel())
    }
}
