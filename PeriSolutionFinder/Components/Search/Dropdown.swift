//
//  Dropdown.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 28.12.22.
//

import SwiftUI

struct Dropdown: View {
    @Binding var isSelected: Bool
    @Binding var structureElements: [Structure]
    @Binding var selectedStructure: Structure
    @Binding var isOpen: Bool

    var body: some View {
        VStack {
            ForEach(structureElements, id: \.self) { structure in
                Button(action: {
                    selectedStructure = structure
                    isOpen = false
                }, label: {
                    Text(structure.rawValue)
                        .padding(2)
                        .foregroundColor(structure == selectedStructure ? Color("PeriRed") : .gray)

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
        Dropdown(isSelected: .constant(true),
                 structureElements: .constant([Structure.Wall, Structure.Slob, Structure.Column]),
                 selectedStructure: .constant(Structure.Slob),
                 isOpen: .constant(true))
    }
}
