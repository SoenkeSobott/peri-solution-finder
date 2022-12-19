//
//  FooterView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.11.22.
//

import SwiftUI

struct FooterView: View {

    @State private var isSearchSelected: Bool = true

    var body: some View {
        ZStack(alignment: .center) {
            Image("")
                .frame(width: UIScreen.main.bounds.width, height: 80)
                .background(Color("PeriRed"))

            HStack() {
                Spacer()

                VStack() {
                    Button {
                        isSearchSelected = true
                        print("Search")
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.white)
                    }

                    Text("Search")
                        .frame(height: 20)
                        .foregroundColor(.white)
                        .fontWeight(isSearchSelected ? .bold : .regular)
                }

                Spacer()

                VStack() {
                    Button {
                        isSearchSelected = false
                        print("Prodcut")
                    } label: {
                        Image(systemName: "shippingbox.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.white)
                    }

                    Text("Product")
                        .frame(height: 20)
                        .foregroundColor(.white)
                        .fontWeight(isSearchSelected ? .regular : .bold)
                }

                Spacer()
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
