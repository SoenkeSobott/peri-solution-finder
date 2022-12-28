//
//  WallCriteriaView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct WallCriteriaView: View {

    @State private var thickness: Double = 10
    @State private var height: Double = 10

    var body: some View {
        VStack {
            SliderView(sliderValue: $thickness,
                       sliderHeader: "Thickness",
                       startValue: 10,
                       endValue: 100,
                       step: 10)
            SliderView(sliderValue: $height,
                       sliderHeader: "Height",
                       startValue: 100,
                       endValue: 1000,
                       step: 100)

            Button(action: {
                print("Add to search")
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
    }
}
