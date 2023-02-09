//
//  ProjectListView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 19.12.22.
//

import SwiftUI

struct ProjectListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var searchModel: SearchModel
    @EnvironmentObject var network: Network
    private let headingViewHeight: CGFloat = UIScreen.main.bounds.height*0.15

    var body: some View {
        VStack() {
            ZStack(alignment: .top) {
                Image("Ellipse")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: headingViewHeight)

                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        NavigationButton(systemName: "arrow.left")
                    })
                    .padding(.leading, 20)

                    Spacer()
                }

                VStack {
                    Text(network.projectsLoading ? "Loading Projects..." : "We found \(network.projects.count) projects with your search criteria")
                        .headline()
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width*0.5, height: headingViewHeight)

                    Spacer()

                    Text("Projects List")
                        .headlineOne()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .padding(.bottom, 0)
                        .padding(.leading, UIScreen.main.bounds.width*0.05)
                        .padding(.trailing, UIScreen.main.bounds.width*0.05)

                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))
                        .opacity(network.projectsLoading ? 1 : 0)

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
                    .opacity(network.projectsLoading ? 0 : 1)
                    .onAppear {
                        if (searchModel.shouldExecuteSearch) {
                            network.getProjects(searchModel: searchModel)
                            searchModel.shouldExecuteSearch = false
                        }
                    }
                    .refreshable {
                        network.getProjects(searchModel: searchModel)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
            .environmentObject(Network())
    }
}
