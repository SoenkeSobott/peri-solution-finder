//
//  BQListHeader.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 25.12.22.
//

import SwiftUI

struct BQListHeader: View {
    private let columns = ["Article Description", "Unit", "Weigth per Unit"]
    @Binding var columnsIndex: Int

    var body: some View {
        HStack(spacing: 0) {

            Text("Article No.")
                .frame(width: UIScreen.main.bounds.width*0.2, height: 50)


            HStack {
                Button(action: {
                    if columnsIndex <= 0 {
                        columnsIndex = 2
                    } else {
                        columnsIndex-=1
                    }
                }, label: {
                    Image(systemName: "arrowtriangle.left.fill")
                        .padding(0)
                        .foregroundColor(Color("PeriRed"))
                })

                Text(columns[columnsIndex])
                    .frame(width: UIScreen.main.bounds.width*0.35)
                    .padding(0)
                    .lineLimit(1)

                Button(action: {
                    if columnsIndex >= 2 {
                        columnsIndex = 0
                    } else {
                        columnsIndex+=1
                    }
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                        .padding(0)
                        .foregroundColor(Color("PeriRed"))
                })
            }
            .frame(width: UIScreen.main.bounds.width*0.5, height: 50)

            Text("Qty")
                .frame(width: UIScreen.main.bounds.width*0.2, height: 50)

        }
        .font(.system(size: 14))
        .fontWeight(.bold)
    }
}

struct BQListHeader_Previews: PreviewProvider {
    static var previews: some View {
        BQListHeader(columnsIndex: .constant(0))
    }
}
