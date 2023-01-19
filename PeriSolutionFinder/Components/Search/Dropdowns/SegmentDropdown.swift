//
//  SegmentDropdown.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 04.01.23.
//

import SwiftUI

struct SegmentDropdown: View {
    @EnvironmentObject var searchModel: SearchModel
    @Binding var isOpen: Bool
    @State private var showingFeatureNotImplementedAlert: Bool = false

    var body: some View {
        VStack {
            ForEach(searchModel.segmentElements, id: \.self) { segment in
                Button(action: {
                    if (segment != .Infrastructure && segment != .Industrial) {
                        showingFeatureNotImplementedAlert = true
                    } else {
                        searchModel.selectedSegment = segment
                        isOpen = false
                    }
                }, label: {
                    Text(segment.rawValue)
                        .padding(2)
                        .foregroundColor(segment == searchModel.selectedSegment ? Color("PeriRed") : .gray)

                })
                .alert(isPresented: $showingFeatureNotImplementedAlert) {
                    Alerts.shared().featureNotAvailableAlert()
                }
            }
        }
        .padding(5)
        .frame(width: UIScreen.main.bounds.width*0.4)
        .font(Font.system(size: 12, weight: .bold))
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
        .shadow(color: .gray.opacity(0.2), radius: 5, y: 5)
        .opacity(isOpen ? 1 : 0)
    }
}

struct SegmentDropdown_Previews: PreviewProvider {
    static var previews: some View {
        SegmentDropdown(isOpen: .constant(true))
            .environmentObject(SearchModel())
    }
}
