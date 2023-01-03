//
//  FooterView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.11.22.
//

import SwiftUI

struct FooterItem: Hashable {
    var name: String
    var systemImageName: String
}

struct FooterView: View {
    private var footerItems = [
        FooterItem(name: "Search", systemImageName: "magnifyingglass.circle.fill"),
        FooterItem(name: "My Solutions", systemImageName: "shippingbox.fill")
    ]
    @State private var selectedIndex: Int = 0
    @State private var showingFeatureNotImplementedAlert: Bool = false

    private func isSelected(index: Int) -> Bool {
        return selectedIndex == index
    }

    var body: some View {
        ZStack(alignment: .center) {
            Image("")
                .frame(width: UIScreen.main.bounds.width, height: 80)
                .background(Color("PeriRed"))

            HStack {

                ForEach(Array(footerItems.enumerated()), id: \.offset) { index, item in
                    Button {
                        if (item.name != "Search") {
                            showingFeatureNotImplementedAlert = true
                        } else {
                            selectedIndex = index
                        }
                    } label: {
                        VStack() {
                            Image(systemName: item.systemImageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.white)

                            Text(item.name)
                                .frame(height: 20)
                                .foregroundColor(.white)
                                .fontWeight(isSelected(index: index) ? .bold : .regular)
                        }
                        .frame(maxWidth: .infinity)

                    }
                    .alert(isPresented: $showingFeatureNotImplementedAlert) {
                        Alerts.shared().featureNotAvailableAlert()
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
                            .frame(height: 20)
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                    }
                    .frame(maxWidth: .infinity)
                })
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
