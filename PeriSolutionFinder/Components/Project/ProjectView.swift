//
//  ProjectView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.12.22.
//

import SwiftUI

struct ProjectView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var projectModel: ProjectModel = ProjectModel()
    let project: Project
    @State private var selectedView: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            HStack() {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    NavigationButton(systemName: "arrow.left")
                })
                .padding(.leading, 20)

                Spacer()

                DownloadButton(projectModel: projectModel, project: project)
            }

            Text(project.projectName)
                .headlineTwo()
                .frame(width: UIScreen.main.bounds.width*0.9)
                .lineLimit(1)
                .padding(UIScreen.main.bounds.width*0.05)

            ZStack() {
                RoundedRectangle(cornerRadius: 25)
                               .fill(.white)
                               .frame(width: UIScreen.main.bounds.width*0.9)
                               .grayViewShadow()

                if selectedView == 0 {
                    TwoDView(viewLink: project.drawingLink ?? "", projectModel: projectModel)
                } else if selectedView == 1 {
                    BQView(projectModel: projectModel, billOfQuantity: project.billOfQuantity ?? [])
                } else if selectedView == 2 {
                    PhotoView(photoUrls: project.pictures ?? [])
                } else if selectedView == 3 {
                    InfoView(project: project)
                }
            }
            .padding(.bottom, UIScreen.main.bounds.width*0.05)

            TabsView(selectedView: $selectedView)
                .frame(height: 60)
                .frame(maxWidth: UIScreen.main.bounds.width*0.85)

        }
        .navigationBarHidden(true)
        .background(Color("BackgroundGray"))
        .onDisappear {
            projectModel.cancelDownloadTask()
        }

    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        let project = Project(
            id: "123ID",
            projectNumber: "123",
            projectName: "My Project with a really long name that does not fit",
            drawingNumber: "Drawing 123")
        ProjectView(project: project)
    }
}
