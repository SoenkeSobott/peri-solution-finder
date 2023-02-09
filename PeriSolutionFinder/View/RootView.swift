//
//  SwiftUIView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 08.02.23.
//

import SwiftUI

struct RootView: View {
    @StateObject var rootModel: RootModel = RootModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch rootModel.selectedIndex {
                case 0:
                    SearchView()
                case 1:
                    ArticlesListView(rootModel: rootModel)
                default:
                    Spacer()
                    Button(action: {
                        rootModel.selectedIndex = 0
                    }, label: {
                        Text("Go Back")
                    })
                    Spacer()
                }
                FooterView(selectedIndex: $rootModel.selectedIndex)
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
