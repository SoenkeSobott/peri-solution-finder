//
//  FooterView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.11.22.
//

import SwiftUI

struct FooterView: View {
    @Binding var selectedIndex: Int
    @State private var showingFeatureNotImplementedAlert: Bool = false
    private let footerItems = [
        FooterItem(name: "Search", systemImageName: "magnifyingglass.circle.fill"),
        FooterItem(name: "Articles", systemImageName: "magnifyingglass.circle.fill"),
    ]

    var body: some View {
        ZStack(alignment: .center) {
            Color("PeriRed")
                .ignoresSafeArea(.all, edges: .bottom)
                .frame(width: UIScreen.main.bounds.width, height: 65)

            HStack {
                ForEach(Array(footerItems.enumerated()), id: \.offset) { index, item in
                    Button {
                        selectedIndex = index
                    } label: {
                        VStack() {
                            Image(systemName: item.systemImageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.white)

                            Text(item.name)
                                .headlineThree()
                                .frame(height: 20)
                                .foregroundColor(.white)
                        }
                        .opacity(selectedIndex == index ? 1 : 0.7)
                        .frame(maxWidth: .infinity)
                    }
                }

                NavigationLink(destination: AboutView(), label: {
                    VStack {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.white)

                        Text("About")
                            .headlineThree()
                            .frame(height: 20)
                            .foregroundColor(.white)
                    }
                    .opacity(0.7)
                    .frame(maxWidth: .infinity)
                })
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(selectedIndex: .constant(0))
    }
}
