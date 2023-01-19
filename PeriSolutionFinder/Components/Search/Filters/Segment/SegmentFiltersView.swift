//
//  SegmentFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 04.01.23.
//

import SwiftUI

struct SegmentFiltersView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State private var totalHeight = CGFloat(100)

    var body: some View {
        VStack(alignment: .center) {
            Text(searchModel.selectedSegment.rawValue)
                .filterHeadingStyle()

            GeometryReader { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .clipped()
                        .shadow(color: .gray.opacity(0.5), radius: 5)

                    HStack {
                        segmentGeometryLayout(geometry: geometry, searchModel: searchModel)
                        Spacer()
                    }
                    .padding(10)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: UIScreen.main.bounds.width*0.9)
                .padding(.leading, UIScreen.main.bounds.width*0.05)
                .padding(.bottom, 10)
                .background(GeometryReader {gp -> Color in
                    DispatchQueue.main.async {
                        self.totalHeight = gp.size.height
                    }
                    return Color.clear
                })
            }
            .frame(height: totalHeight)
        }
    }
}

struct segmentGeometryLayout: View {
    let geometry: GeometryProxy
    let searchModel: SearchModel

    var body: some View {
        if (searchModel.selectedSegment == .Infrastructure) {
            self.generateContent(in: geometry, items: searchModel.infrastructureElements.map{ $0.rawValue })
        } else {
            self.generateContent(in: geometry, items: searchModel.industrialElements.map{ $0.rawValue })
        }
    }

    private func generateContent(in g: GeometryProxy, items: [String]) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        let padding: CGFloat = 10

        return ZStack(alignment: .topLeading) {
            ForEach(items, id: \.self) { item in
                self.getButtonText(for: item,
                                   isSelected: searchModel.isSegmentFilterSelected(element: item), padding: padding)
                    .onTapGesture {
                        searchModel.executeSegmentFilterAction(element: item)
                    }
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > (g.size.width*0.9)-(padding*2))
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == items.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if item == items.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }

    func getButtonText(for text: String, isSelected: Bool, padding: CGFloat) -> some View {
        HStack {
            Text(text)
                .frame(height: 40)
                .padding(.leading, padding)
                .padding(.trailing, padding)
                .background(.white)
                .foregroundColor(isSelected ? Color("PeriRed") : .gray)
                .cornerRadius(25)
                .font(Font.system(size: 12, weight: .medium))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(isSelected ? Color("PeriRed") : .gray, lineWidth: 1)
        )
    }
}

struct SegmentFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentFiltersView()
            .environmentObject(SearchModel())
    }
}
