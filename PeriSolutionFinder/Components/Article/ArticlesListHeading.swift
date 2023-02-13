//
//  ArticlesListHeader.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 11.02.23.
//

import SwiftUI

struct ArticlesListHeading: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("Art. No.")
                .frame(width: UIScreen.main.bounds.width*0.17)

            Text("Description")
                .frame(width: UIScreen.main.bounds.width*0.25)

            Text("LP-1 (HKD)")
                .frame(width: UIScreen.main.bounds.width*0.18)

            Text("Qty")
                .frame(width: UIScreen.main.bounds.width*0.2)
        }
        .font(.system(size: 12))
        .frame(height: 40)
        .fontWeight(.bold)
    }
}

struct ArticlesListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListHeading()
    }
}
