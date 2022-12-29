//
//  Dropdown.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct Dropdown: View {
    @EnvironmentObject var searchModel: SearchModel
    @Binding var isOpen: Bool

    var body: some View {
        VStack {
            ForEach(searchModel.structureElements, id: \.self) { structure in
                Button(action: {
                    searchModel.selectedStructure = structure
                    isOpen = false
                }, label: {
                    Text(structure.rawValue)
                        .padding(2)
                        .foregroundColor(structure == searchModel.selectedStructure ? Color("PeriRed") : .gray)

                })
                //.disabled(structure != Structure.Wall)
            }
        }
        .padding(5)
        .frame(width: UIScreen.main.bounds.width*0.4)
        .font(Font.system(size: 12, weight: .bold))
        .background(Color.white)
        .cornerRadius(15)
        .clipped()
        .shadow(color: .gray.opacity(0.2), radius: 5, y: 5)
        .opacity(isOpen ? 1 : 0)
    }
}

struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        Dropdown(isOpen: .constant(true))
    }
}
