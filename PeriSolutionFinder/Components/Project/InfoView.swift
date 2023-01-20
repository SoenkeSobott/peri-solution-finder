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
        VStack(alignment: .leading, spacing: 5) {
            Text("Info")
                .headline()
            Text("SolutionTags: \(project.solutionTags?.joined(separator: ", ") ?? "-")")
                .text()
            Text("Segment: \(project.segmentLevelOne ?? "-")")
                .text()
            Text("SegmentLevelTwo: \(project.segmentLevelTwo ?? "-")")
                .text()
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
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
