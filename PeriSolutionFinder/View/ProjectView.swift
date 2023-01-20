//
//  ProjectView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.12.22.
//

import SwiftUI

struct ProjectView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let project: Project
    @State private var selectedView: Int = 0

    var body: some View {

        VStack() {
            HStack() {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButton()
                })
                .padding(.leading, 20)

                Spacer()
            }
            .padding(.bottom, 10)

            ZStack() {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                               .fill(.white)
                               .frame(width: UIScreen.main.bounds.width*0.9)

                if selectedView == 0 {
                    TwoDView(viewLink: project.drawingLink ?? "")
                } else if selectedView == 1 {
                    BQView(billOfQuantity: project.billOfQuantity ?? [])
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

    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        let project = Project(
            id: "123ID",
            projectNumber: "123",
            projectName: "My Project",
            drawingNumber: "Drawing 123")
        ProjectView(project: project)
    }
}
