//
//  ArticleListHeader.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 13.02.23.
//

import SwiftUI

struct ArticleListHeader: View {
    @State private var showDownloadAlert = false

    var body: some View {
        HStack {
            Text("Articles")
                .headline()
                .padding(5)
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
        .overlay(alignment: .trailing) {
            Button(action: {
                showDownloadAlert = true
            }, label: {
                NavigationButton(systemName: "arrow.down.to.line")
            })
        }
        .padding([.top, .bottom], UIScreen.main.bounds.width*0.025)
        .alert(isPresented: $showDownloadAlert) {
            Alert(title: Text("Notice"),
                  message: Text("You are being redirected to download the file. Once the download is complete, the file will be available in your local files."),
                  primaryButton: .default(Text("Download"), action: {
                if let url = URL(string: "https://perisolutionxstorage.blob.core.windows.net/excel/Articles_List.xlsx") {
                   UIApplication.shared.open(url)
                }
            }), secondaryButton: .cancel(Text("Cancel")))
        }    }
}

struct ArticleListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListHeader()
    }
}
