//
//  ProjectListView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 19.12.22.
//

import SwiftUI

struct ProjectListView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        NavigationStack {
            VStack() {
                ZStack() {
                    Circle()
                        .scale(3)
                        .fill(Color.gray.opacity(0.05))
                        .offset(x: 0 , y: -UIScreen.main.bounds.height)

                    VStack {
                        Text("We found \(network.projects.count) projects with your search criteria")
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

                        List(network.projects, id: \.projectNumber) { project in
                            ZStack {
                                NavigationLink(destination: ProjectView(project: project)) {
                                    EmptyView()
                                }.opacity(0)
                                ProjectRow(project: project)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(.plain)
                        .onAppear {
                            network.getProjects()
                        }
                    }
                }
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
            .environmentObject(Network())
    }
}
