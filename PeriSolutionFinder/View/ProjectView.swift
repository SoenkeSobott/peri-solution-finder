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

        VStack() {
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
                .padding(10)

            ZStack() {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                               .fill(.white)
                               .frame(width: UIScreen.main.bounds.width*0.9)

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

            Spacer()

            ZStack() {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                               .fill(.white)

                HStack(spacing: 0) {
                    Button(action: {
                        selectedView = 0
                    }, label: {
                        Text("2D")
                            .redBackgroundWithRoundedCorners(isSelected: selectedView == 0)
                    })
                    .padding(.leading, 5)

                    Spacer()

                    Button(action: {
                        selectedView = 1
                    }, label: {
                        Text("BQ")
                            .redBackgroundWithRoundedCorners(isSelected: selectedView == 1)
                    })

                    Spacer()

                    Button(action: {
                        selectedView = 2
                    }, label: {
                        Text("PHOTO")
                            .redBackgroundWithRoundedCorners(isSelected: selectedView == 2)
                    })

                    Spacer()

                    Button(action: {
                        selectedView = 3
                    }, label: {
                        Text("INFO")
                            .redBackgroundWithRoundedCorners(isSelected: selectedView == 3)
                    })
                    .padding(.trailing, 5)
                }
            }
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
