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

                    HStack {
                        geometryLayout2(geometry: geometry)
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
            ForEach(searchModel.solutionElements, id: \.self) { solution in
                self.getButtonText(for: solution, isSelected: isSelected)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if solution == searchModel.solutionElements.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if solution == searchModel.solutionElements.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }

    func getButtonText(for solution: Solution, isSelected: Bool) -> some View {
        Button(action: {
            if (searchModel.selectedSolutionElements.contains(solution)) {
                searchModel.selectedSolutionElements.removeAll { $0 == solution }
            } else {
                searchModel.selectedSolutionElements.append(solution)
            }
        }, label: {
            Text(solution.rawValue)
                .frame(height: 40)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .background(.white)
                .foregroundColor(isSolutionSelected(solution: solution) ? Color("PeriRed") : .gray)
                .cornerRadius(25)
                .font(Font.system(size: 12, weight: .medium))
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(isSolutionSelected(solution: solution) ? Color("PeriRed") : .gray, lineWidth: 1)
                )
        })

    }

    func isSolutionSelected(solution: Solution) -> Bool {
        return searchModel.selectedSolutionElements.contains(solution)
    }
}
