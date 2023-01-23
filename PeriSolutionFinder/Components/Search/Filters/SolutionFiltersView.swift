//
//  SolutionFiltersView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 04.01.23.
//

import SwiftUI

struct SolutionFiltersView: View {
    @EnvironmentObject var searchModel: SearchModel
    @EnvironmentObject var network: Network
    @State private var totalHeight = CGFloat(100)

    var body: some View {
        VStack(alignment: .center) {
            Text("Solution")
                .filterHeadlineStyle()

            GeometryReader { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .clipped()
                        .shadow(color: .gray.opacity(0.5), radius: 5)

                    if (network.solutionTagsLoading) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))
                            .padding(30)
                    } else {
                        if (network.solutionTags.count > 0) {
                            HStack {
                                geometryLayoutSolutionTags(geometry: geometry,
                                                           searchModel: searchModel,
                                                           solutionTags: $network.solutionTags)
                                Spacer()
                            }
                            .padding(5)
                        } else {
                            Text("No Solution Tags found")
                                .padding(30)
                        }
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: UIScreen.main.bounds.width*0.9)
                .padding(.leading, UIScreen.main.bounds.width*0.05)
                .padding(.trailing, UIScreen.main.bounds.width*0.05)
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
        .onAppear{
            network.getSolutionTags(searchModel: searchModel)
        }
    }
}

struct SolutionFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionFiltersView()
            .environmentObject(SearchModel())
            .environmentObject(Network())
    }
}

struct geometryLayoutSolutionTags: View {
    let geometry: GeometryProxy
    var searchModel: SearchModel
    @Binding var solutionTags: [SolutionTag]
    @State private var isSelected = false

    var body: some View {
        self.generateContent(in: geometry)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        let padding: CGFloat = 5

        return ZStack(alignment: .topLeading) {
            ForEach(solutionTags, id: \.self) { solution in
                self.getButtonText(for: solution, isSelected: isSelected)
                    .padding([.horizontal, .vertical], 5)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > (g.size.width*0.9)-(padding))
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if solution == solutionTags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if solution == solutionTags.last! {
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
                .text()
                .frame(height: 40)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .background(.white)
                .foregroundColor(isSolutionTagSelected(solutionTag: solutionTag) ? Color("PeriRed") : .gray)
                .cornerRadius(25)
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
