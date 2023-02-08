//
//  SearchField.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 26.12.22.
//

import SwiftUI

struct SearchProjectsField: View {
    @EnvironmentObject var searchModel: SearchModel
    @State private var searchTerm: String = ""

    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Search Projects", text: $searchModel.searchTerm)
                .font(Font.system(size: 18, weight: .medium, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 40)
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 55))
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: .black.opacity(0.05), radius: 50)
                .submitLabel(.done)

            NavigationLink(destination: ProjectListView()){
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(Color("PeriRed"))
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(color: Color("PeriRed").opacity(0.2), radius: 5)
                    .padding(.trailing, 10)
            }
        }
        .padding(.leading, UIScreen.main.bounds.width*0.05)
        .padding(.trailing, UIScreen.main.bounds.width*0.05)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchProjectsField()
            .environmentObject(SearchModel())
    }
}
