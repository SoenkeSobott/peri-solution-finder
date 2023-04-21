//
//  File.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 19.12.22.
//

import SwiftUI

struct ProjectRow : View {
    @EnvironmentObject var network: Network
    let project: Project

    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("PeriLightGray"))
                .frame(height: 80)

            HStack() {
                ZStack() {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .grayViewShadow()
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(Color("PeriRed"))
                }.padding(.leading, 10)

                Text(project.projectName)
                    .headlineThree()
                Spacer()
                /*Text(getPriceText())
                    .text()
                    .frame(width: UIScreen.main.bounds.width*0.25, alignment: .trailing)
                    .padding(.trailing, 10)*/
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
        .listRowSeparator(.hidden)
    }

    func getPriceText() -> String {
        if (project.billOfQuantity != nil) {
            return "$ " + formatPrice(project: project)
        }
        return "No BQ"
    }
}

struct ProjectRow_Previews: PreviewProvider {
    static var previews: some View {
        let project = Project(id: "1234-1234",
                              projectNumber: "123-332-323-3",
                              projectName: "Test Project 911",
                              drawingNumber: "2323-232-33-22",
                              m2OfFormwork: 200000,
                              product: "DUO",
                              projectPrice: 3060500.50)
        ProjectRow(project: project)
            .environmentObject(Network())
    }
}

