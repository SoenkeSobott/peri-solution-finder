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
    @Binding var selectedIndex: Int
    @Binding var isOpen: Bool

    var body: some View {
        VStack {
            ForEach(structureElements.indices, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                    isOpen = false
                }, label: {
                    Text(structureElements[index].rawValue)
                        .padding(2)
                        .foregroundColor(selectedIndex == index ? Color("PeriRed") : .gray)

                })
                .disabled(structureElements[index] != Structure.Wall)

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
                 selectedIndex: .constant(0),
                 isOpen: .constant(true))
    }
}
