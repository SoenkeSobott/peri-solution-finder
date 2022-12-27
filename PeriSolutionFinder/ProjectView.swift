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
                }).padding(.leading, 20)

                Spacer()
            }

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
                }
            }

            Spacer()

            ZStack() {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                               .fill(.white)
                               .frame(width: UIScreen.main.bounds.width*0.9, height: 60)

                HStack() {
                    Spacer()

                    Button(action: {
                        selectedView = 0
                    }, label: {
                        Text("2D")
                            .redBackgroundWithRoundedCorners(isSelected: selectedView == 0)
                    })

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
                        Text("Photo")
                            .redBackgroundWithRoundedCorners(isSelected: selectedView == 2)
                    })

                    Spacer()
                }
            }


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
