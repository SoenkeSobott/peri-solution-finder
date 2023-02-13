//
//  File.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 19.12.22.
//

import SwiftUI

struct ProjectRow : View {
    @EnvironmentObject var network: Network
    @State private var isSelected: Bool = false
    let project: Project

    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 15)
                .fill(isSelected ? Color.white : Color("PeriLightGray"))
                .frame(width: UIScreen.main.bounds.width*0.9, height: 80)

            HStack() {
                ZStack() {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(isSelected ? Color("PeriRed") : Color.white)
                        .frame(width: 60, height: 60)
                        .grayViewShadow()
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(isSelected ? Color.white : Color("PeriRed"))
                }.padding(.leading, 10)

                Text(project.projectName)
                    .headlineTwo()
                Spacer()
                Text(formatPrice(project: project))
                    .text()
                    .padding(.trailing, 10)
            }
        }
        .listRowSeparator(.hidden)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("PeriRed"), lineWidth: isSelected ? 1 : 0)
        )
    }
}

