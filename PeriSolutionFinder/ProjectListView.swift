//
//  ProjectListView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 19.12.22.
//

import SwiftUI

let projects = [
    Project(projectNumber: "number-123", projectName: "xy-solution-long-name-asdsasdasdsadsdsadd"),
    Project(projectNumber: "number-911", projectName: "Top-solution"),
    Project(projectNumber: "number-918", projectName: "Best-solution"),
    Project(projectNumber: "number-910", projectName: "Best-solution"),
]

struct ProjectListView: View {
    var body: some View {
        VStack() {
            ZStack() {
                Circle()
                    .scale(3)
                    .fill(Color.gray.opacity(0.05))
                    .offset(x: 0 , y: -UIScreen.main.bounds.height)

                VStack {
                    Text("We found XY projects with your seach criteria")
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 20, weight: .bold
                                          , design: .default))
                        .padding(30)

                    Spacer()

                    Text("Projects List")
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .padding(.top, 30)
                        .padding(.bottom, 0)
                        .padding(.leading, UIScreen.main.bounds.width*0.05)
                        .padding(.trailing, UIScreen.main.bounds.width*0.05)

                    List(projects, id: \.projectNumber) { project in
                        ProjectRow(project: project)
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
