//
//  AboutView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 29.12.22.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButton()
                })
                .padding(.leading, 20)
                Spacer()
            }

            VStack(alignment: .center, spacing: 10) {
                Text("About")
                Text("Used Libraries")
                Text("[SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)")
            }
            .padding(.top, 20)




            Spacer()
        }
        .background(Color("BackgroundGray"))
        .navigationBarHidden(true)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
