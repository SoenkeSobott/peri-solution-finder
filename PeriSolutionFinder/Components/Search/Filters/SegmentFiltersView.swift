//
//  SegmentFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 04.01.23.
//

import SwiftUI

struct SegmentFiltersView: View {
    var body: some View {
        VStack {
            Text("Segment")
                .filterHeadingStyle()
        }
    }
}

struct SegmentFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentFiltersView()
    }
}
