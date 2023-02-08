//
//  AvailabilityLegendView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct AvailabilityLegendView: View {
    var body: some View {
        HStack {
            Image(systemName: "capsule.fill")
                .font(.system(size: 15))
                .foregroundColor(Color("InStockGreen"))
                .padding(.leading, UIScreen.main.bounds.width*0.05)

            Text("In Stock")
                .text()

            Image(systemName: "capsule.fill")
                .font(.system(size: 15))
                .foregroundColor(Color("OutOfStockYellow"))

            Text("Out Of Stock")
                .text()

            Spacer()
        }
    }
}

struct AvailabilityLegendView_Previews: PreviewProvider {
    static var previews: some View {
        AvailabilityLegendView()
    }
}
