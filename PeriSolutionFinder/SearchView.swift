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
    private let searchViewHeight: CGFloat = UIScreen.main.bounds.height*0.3

    var body: some View {
        NavigationStack {

            ZStack(alignment: .top) {
                Image("Ellipse")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: searchViewHeight)

                VStack(alignment: .center) {

                    VStack {
                        Text("Find your Reference Solution")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                            .font(Font.system(size: 22, weight: .medium, design: .default))
                            .padding(.top, 20)
                            .padding(.bottom, 20)

                        SearchCriteriaView(searchTerm: $searchTerm)
                        
                    }
                    .frame(height: searchViewHeight)


                    Text("Sort By Projects")
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .font(Font.system(size: 22, weight: .medium, design: .default))
                        .padding(.bottom, 0)
                        .padding(.leading, UIScreen.main.bounds.width*0.05)
                        .padding(.trailing, UIScreen.main.bounds.width*0.05)

                    Spacer()

                    NavigationLink(destination: ProjectListView()){
                        Text("Add to Search")
                            .foregroundColor(Color("PeriRed"))
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width*0.9, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color("PeriRed"), lineWidth: 2)
                            )
                            .background(Color.white)
                            .cornerRadius(50)
                            .shadow(color: .red.opacity(0.2), radius: 50, y: 30)
                            .padding(.bottom, 20)
                    }

                    FooterView()
                }
            }


        }
    }
}


struct SearchCriteriaView: View {
    @Binding var searchTerm: String

    var body: some View {
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

        HStack {
            Text("Product")
                .foregroundColor(Color("PeriRed"))
                .frame(width: UIScreen.main.bounds.width*0.4, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("PeriRed"), lineWidth: 2)
                )
                .background(Color.white)
                .cornerRadius(50)

            Text("Structure")
                .foregroundColor(Color("PeriRed"))
                .frame(width: UIScreen.main.bounds.width*0.4, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("PeriRed"), lineWidth: 2)
                )
                .background(Color.white)
                .cornerRadius(50)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
