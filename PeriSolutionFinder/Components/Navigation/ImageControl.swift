//
//  ImageControl.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct ImageControl: View {
    @Binding var selectedTab: Int
    @State var maxImages: Int

    var body: some View {
        HStack {
            Button(action: {
                if (selectedTab > 0) {
                    selectedTab-=1
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(Font.system(size: 20, weight: .bold))
                    .padding(.leading, 20)
                    .foregroundColor(Color("PeriRed"))
            })

            PageControl(maxPages: maxImages, currentPage: $selectedTab)

            Button(action: {
                if (selectedTab < maxImages-1) {
                    selectedTab+=1
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(Font.system(size: 20, weight: .bold))
                    .padding(.trailing, 20)
                    .foregroundColor(Color("PeriRed"))
            })
        }
    }
}

struct ImageControl_Previews: PreviewProvider {
    static var previews: some View {
        ImageControl(selectedTab: .constant(1), maxImages: 5)
    }
}
