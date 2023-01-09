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
                        geometryLayout(geometry: geometry)
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

struct geometryLayout: View {
    @EnvironmentObject var searchModel: SearchModel
    @State private var isSelected = false
    let geometry: GeometryProxy

    var body: some View {
        self.generateContent(in: geometry)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(searchModel.infrastructureElements, id: \.self) { infrastructure in
                self.getButtonText(for: infrastructure, isSelected: isSelected)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if infrastructure == searchModel.infrastructureElements.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if infrastructure == searchModel.infrastructureElements.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }

    func getButtonText(for infrastructure: Infrastructure, isSelected: Bool) -> some View {
        Button(action: {
            if (searchModel.selectedInfrastructureElements.contains(infrastructure)) {
                searchModel.selectedInfrastructureElements.removeAll { $0 == infrastructure }
            } else {
                searchModel.selectedInfrastructureElements.append(infrastructure)
            }
        }, label: {
            HStack {
                Text(infrastructure.rawValue)
                    .frame(height: 40)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .background(.white)
                    .foregroundColor(isInfrastructureSelected(infrastructure: infrastructure) ? Color("PeriRed") : .gray)
                    .cornerRadius(25)
                    .font(Font.system(size: 12, weight: .medium))
            }
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(isInfrastructureSelected(infrastructure: infrastructure) ? Color("PeriRed") : .gray, lineWidth: 1)
            )


        })

    }

    func isInfrastructureSelected(infrastructure: Infrastructure) -> Bool {
        return searchModel.selectedInfrastructureElements.contains(infrastructure)
    }
}

struct SegmentFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentFiltersView()
            .environmentObject(SearchModel())
    }
}
