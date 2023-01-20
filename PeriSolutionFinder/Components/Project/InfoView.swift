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
                    InfoRowView(name: "M2 of Concrete", value: project.m2OfConcrete?.description ?? "-")
                    InfoRowView(name: "M2 of Formwork", value: project.m2OfFormwork?.description ?? "-")
                    InfoRowView(name: "Length", value: project.lenght?.description ?? "-")
                    InfoRowView(name: "Width", value: project.width?.description ?? "-")
                    InfoRowView(name: "Thickness", value: project.thickness?.description ?? "-")
                    InfoRowView(name: "Formwork Height", value: project.height?.description ?? "-")
                    InfoRowView(name: "Max. Pour Height", value: project.maxPourHeight?.description ?? "-")
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
