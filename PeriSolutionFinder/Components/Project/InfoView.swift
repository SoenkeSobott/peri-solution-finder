//
//  InfoView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.01.23.
//

import SwiftUI

struct InfoView: View {
    let project: Project

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List() {
                Group {
                    InfoRowView(name: "Project Name", value: project.projectName)
                    InfoRowView(name: "Project Number", value: project.projectNumber)
                    InfoRowView(name: "Main Structure", value: project.mainStructure?.description ?? "-")
                    InfoRowView(name: "M2 of Concrete", value: formatNumber(number: project.m2OfConcrete))
                    InfoRowView(name: "M2 of Formwork", value: formatNumber(number: project.m2OfFormwork))
                    InfoRowView(name: "Length [cm]", value: formatNumber(number: project.lenght))
                    InfoRowView(name: "Width [cm]", value: formatNumber(number: project.width))
                    InfoRowView(name: "Thickness [cm]", value: formatNumber(number: project.thickness))
                    InfoRowView(name: "Formwork Height [cm]", value: formatNumber(number: project.height))
                    InfoRowView(name: "Max. Pour Height [cm]", value: formatNumber(number: project.maxPourHeight))
                }

                Group {
                    InfoRowView(name: "Location", value: project.location ?? "-")
                    InfoRowView(name: "Segment Level 1", value: project.segmentLevelOne ?? "-")
                    InfoRowView(name: "Segment Level 2", value: project.segmentLevelTwo ?? "-")
                    InfoRowView(name: "Solution Tags", value: (project.solutionTags?.joined(separator: ", ") ?? "-"))
                }

            }
            .scrollContentBackground(.hidden)
            .background(Color("PeriLightGray"))
            .cornerRadius(20)
            .listStyle(.plain)
        }
        .padding(15)
        .frame(width: UIScreen.main.bounds.width*0.9)
        .cornerRadius(20)
    }

    private func formatNumber(number: Float?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0;
        if (number != nil) {
            return formatter.string(from: number! as NSNumber) ?? "-"
        }
        return "-"
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        let project = Project(
            id: "123ID",
            projectNumber: "123",
            projectName: "My Project",
            drawingNumber: "Drawing 123")
        
        InfoView(project: project)
    }
}
