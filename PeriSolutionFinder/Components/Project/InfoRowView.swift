//
//  InfoRowView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 20.01.23.
//

import SwiftUI

struct InfoRowView: View {
    let name: String
    let value: String

    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .headlineThree()
                    .frame(width: UIScreen.main.bounds.width*0.3, alignment: .leading)

                Text(value)
                    .text()

                Spacer()
            }

            Divider().background(.gray)
        }
        .listRowBackground(Color("PeriLightGray"))
        .listRowSeparator(.hidden)
    }
}

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(name: "Solution", value: "one, two, three, four")
    }
}
