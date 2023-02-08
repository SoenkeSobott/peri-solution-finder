//
//  NoDataView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        Spacer()
        VStack(spacing: 20) {
            Text("Sorry!")
                .text()
            Text("There is no data for this project.")
                .text()
        }
        Spacer()
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
