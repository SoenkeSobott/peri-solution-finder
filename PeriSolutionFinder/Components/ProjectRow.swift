//
//  File.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 19.12.22.
//

import SwiftUI

struct ProjectRow : View {
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
                        .shadow(color: .black.opacity(0.05), radius: 15)
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(isSelected ? Color.white : Color("PeriRed"))
                }.padding(.leading, 10)

                Text(project.projectName)
                    .headlineTwo()
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
                    .frame(width: 40, height: 40, alignment: .center)
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

