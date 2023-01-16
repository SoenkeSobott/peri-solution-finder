//
//  AboutView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 29.12.22.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showingCopiedMailAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButton()
                })
                .padding(.leading, UIScreen.main.bounds.width*0.05)
                .frame(maxWidth: .infinity, alignment: .leading)

                Text("About")
                    .font(Font.system(size: 22, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)

                Spacer()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }



            VStack(alignment: .leading, spacing: 10) {
                Text("Feedback")
                    .font(Font.system(size: 22, weight: .medium, design: .default))
                Text("Thanks for testing our Beta Version. We'd love to hear your feedback. " +
                        "You can simply send all comments and questions to:")

                HStack {
                    Link("sebastian.link@peri.net.cn", destination: URL(string: "mailto:sebastian.link@peri.net.cn")!)

                    Spacer()

                    Button(action: {
                        UIPasteboard.general.setValue("sebastian.link@peri.net.cn", forPasteboardType: "public.plain-text")
                        showingCopiedMailAlert.toggle()
                    }, label: {
                        Text("Copy Mail")
                            .foregroundColor(.black)
                            .padding(10)
                            .frame(height: 40)
                            .background(Color.white)
                            .cornerRadius(50)
                            .shadow(color: .gray.opacity(0.2), radius: 5)
                    })
                    .alert("Mail copied to clipboard", isPresented: $showingCopiedMailAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }

                Text("Data")
                    .font(Font.system(size: 22, weight: .medium, design: .default))
                Text("All project data is owned by PERI (Hong Kong) Limited")

                Text("Used Libraries")
                    .font(Font.system(size: 22, weight: .medium, design: .default))
                Text("[SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)")
                Text("[RangeUISlider](https://github.com/chicio/RangeUISlider)")
            }
            .padding(.top, 10)
            .padding(.leading, UIScreen.main.bounds.width*0.05)
            .padding(.trailing, UIScreen.main.bounds.width*0.05)

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
