//
//  SearchView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 21.11.22.
//

import SwiftUI

struct SearchView: View {

    // Definitions
    @State private var searchTerm: String = ""

    var body: some View {
        VStack(alignment: .center) {

            Text("Search Products")
                .foregroundColor(Color.black)
                .fontWeight(.bold)
                .font(Font.system(size: 22, weight: .medium, design: .default))
                .padding(.top, 20)
                .padding(.bottom, 20)

            ZStack(alignment: .leading) {
                TextField("Search Projects", text: $searchTerm)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 10))
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: .black.opacity(0.05), radius: 50)


                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(Color("PeriRed"))
                    .padding(.leading, 10)

            }
            .padding(.leading, UIScreen.main.bounds.width*0.05)
            .padding(.trailing, UIScreen.main.bounds.width*0.05)


            Text("Sort By Projects")
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .font(Font.system(size: 22, weight: .medium, design: .default))
                .padding(.top, 20)
                .padding(.bottom, 0)
                .padding(.leading, UIScreen.main.bounds.width*0.05)
                .padding(.trailing, UIScreen.main.bounds.width*0.05)

            Spacer()
            
            FooterView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
