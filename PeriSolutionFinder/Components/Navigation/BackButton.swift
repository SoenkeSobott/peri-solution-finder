//
//  BackButton.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 27.12.22.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.red)
            .padding(20)
            .background(Color.white)
            .clipShape(Circle())
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
