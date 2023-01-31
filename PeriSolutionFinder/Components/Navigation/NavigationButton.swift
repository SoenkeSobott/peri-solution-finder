//
//  BackButton.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 27.12.22.
//

import SwiftUI

struct NavigationButton: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .frame(width: 20, height: 20)
            .font(.system(size: 20))
            .foregroundColor(.red)
            .padding(20)
            .background(Color.white)
            .clipShape(Circle())
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(systemName: "ellipsis")
    }
}
