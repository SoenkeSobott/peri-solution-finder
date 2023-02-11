//
//  ArticlesListHeader.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 11.02.23.
//

import SwiftUI

struct ArticlesListHeader: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("Article No.")
                .frame(width: UIScreen.main.bounds.width*0.2)

            Text("Description")
                .frame(width: UIScreen.main.bounds.width*0.3)

            Text("LP-1")
                .frame(width: UIScreen.main.bounds.width*0.15)

            Text("Qty")
                .frame(width: UIScreen.main.bounds.width*0.15)
        }
        .font(.system(size: 12))
        .frame(height: 40)
        .fontWeight(.bold)
    }
}

struct ArticlesListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListHeader()
    }
}
