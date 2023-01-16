//
//  ProjectListView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 19.12.22.
//

import SwiftUI

struct ProjectListView: View {
    @EnvironmentObject var searchModel: SearchModel
    @EnvironmentObject var network: Network
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                        BackButton()
                    })
                    .padding(.leading, 20)

                    Spacer()
                }


                VStack {
                    Text("We found \(network.projects.count) projects with your search criteria")
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width*0.5, height: headingViewHeight)
                        .font(Font.system(size: 20, weight: .bold, design: .default))

                    Spacer()

                    Text("Projects List")
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.system(size: 20, weight: .bold, design: .default))
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
                        network.getProjects(
                            searchTerm: searchModel.searchTerm,
                            product: searchModel.getSelectedProduct(),
                            wallMinThickness: searchModel.wallThicknessLowValue,
                            wallMaxThickness: searchModel.wallThicknessHighValue,
                            wallMinHeight: searchModel.wallHeightLowValue,
                            wallMaxHeight: searchModel.wallHeightHighValue,
                            columnMinThickness: searchModel.columnThicknessLowValue,
                            columnMaxThickness: searchModel.columnThicknessHighValue,
                            columnMinHeight: searchModel.columnHeightLowValue,
                            columnMaxHeight: searchModel.columnHeightHighValue,
                            infrastructureElements: searchModel.selectedInfrastructureElements,
                            solutionTags: searchModel.selectedSolutionTags)
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
