//
//  SolutionFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 04.01.23.
//

import SwiftUI

struct SolutionFiltersView: View {
    @EnvironmentObject var searchModel: SearchModel
    @State private var totalHeight = CGFloat(100)

    var body: some View {
        VStack(alignment: .center) {
            Text("Solution")
                .filterHeadingStyle()

            GeometryReader { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .clipped()
                        .shadow(color: .gray.opacity(0.5), radius: 5)

                    ScrollView {
                        geometryLayout2(geometry: geometry)
                    }
                    .padding(10)
                }
                .frame(width: UIScreen.main.bounds.width*0.9)
                .padding(.leading, UIScreen.main.bounds.width*0.05)
                .padding(.trailing, UIScreen.main.bounds.width*0.05)
                .padding(.bottom, 10)
            }
        }
    }
}

struct SolutionFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionFiltersView()
            .environmentObject(SearchModel())
    }
}

struct geometryLayout2: View {
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
            ForEach(searchModel.solutionTags, id: \.self) { solution in
                self.getButtonText(for: solution, isSelected: isSelected)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width*0.9)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if solution == searchModel.solutionTags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if solution == searchModel.solutionTags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }

    func getButtonText(for solutionTag: SolutionTag, isSelected: Bool) -> some View {
        Button(action: {
            if (searchModel.selectedSolutionTags.contains(solutionTag)) {
                searchModel.selectedSolutionTags.removeAll { $0 == solutionTag }
            } else {
                searchModel.selectedSolutionTags.append(solutionTag)
            }
        }, label: {
            Text(solutionTag.rawValue)
                .frame(height: 40)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .background(.white)
                .foregroundColor(isSolutionTagSelected(solutionTag: solutionTag) ? Color("PeriRed") : .gray)
                .cornerRadius(25)
                .font(Font.system(size: 12, weight: .medium))
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(isSolutionTagSelected(solutionTag: solutionTag) ? Color("PeriRed") : .gray, lineWidth: 1)
                )
        })

    }

    func isSolutionTagSelected(solutionTag: SolutionTag) -> Bool {
        return searchModel.selectedSolutionTags.contains(solutionTag)
    }
}
