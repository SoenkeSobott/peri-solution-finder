//
//  TabsView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 09.02.23.
//

import SwiftUI

struct TabsView: View {
    @Binding var selectedView: Int

    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                           .fill(.white)

            HStack(spacing: 0) {
                Button(action: {
                    selectedView = 0
                }, label: {
                    Text("2D")
                        .redBackgroundWithRoundedCorners(isSelected: selectedView == 0)
                })
                .padding(.leading, 5)

                Spacer()

                Button(action: {
                    selectedView = 1
                }, label: {
                    Text("BQ")
                        .redBackgroundWithRoundedCorners(isSelected: selectedView == 1)
                })

                Spacer()

                Button(action: {
                    selectedView = 2
                }, label: {
                    Text("PHOTO")
                        .redBackgroundWithRoundedCorners(isSelected: selectedView == 2)
                })

                Spacer()

                Button(action: {
                    selectedView = 3
                }, label: {
                    Text("INFO")
                        .redBackgroundWithRoundedCorners(isSelected: selectedView == 3)
                })
                .padding(.trailing, 5)
            }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(selectedView: .constant(0))
    }
}
