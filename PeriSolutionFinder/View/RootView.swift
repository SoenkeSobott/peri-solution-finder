//
//  SwiftUIView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct RootView: View {
    @StateObject var rootModel: RootModel = RootModel()
    @State private var selectedIndex: Int = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch selectedIndex {
                case 0:
                    SearchView()
                case 1:
                    ArticlesListView(rootModel: rootModel)
                default:
                    Spacer()
                    Button(action: {
                        selectedIndex = 0
                    }, label: {
                        Text("Go Back")
                    })
                    Spacer()
                }
                FooterView(selectedIndex: $selectedIndex)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
