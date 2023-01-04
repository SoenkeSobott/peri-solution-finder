//
//  SolutionFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 04.01.23.
//

import SwiftUI

struct SolutionFiltersView: View {
    var body: some View {
        VStack {
            Text("Solution")
                .filterHeadingStyle()
        }
    }
}

struct SolutionFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionFiltersView()
    }
}
