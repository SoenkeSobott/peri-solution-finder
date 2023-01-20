//
//  InfrastructureLowLevelFilterView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 09.01.23.
//

import SwiftUI

struct InfrastructureLowLevelFilterView: View {
    @EnvironmentObject var searchModel: SearchModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("PeriLightGray"))

            VStack {
                ForEach(searchModel.waterPlantElements, id: \.self) { item in
                    Button(action: {
                        if (searchModel.selectedWaterPlantElements.contains(item)) {
                            searchModel.selectedWaterPlantElements.removeAll { $0 == item }
                        } else {
                            searchModel.selectedWaterPlantElements.append(item)
                        }
                    }, label: {
                        Text(item.rawValue)
                            .frame(width: UIScreen.main.bounds.width*0.8, height: 50)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .background(.white)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                            .font(Font.system(size: 12, weight: .medium))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isSelected(item: item) ? Color("PeriRed") : .gray, lineWidth: 1)
                            )
                    })

                }
            }
            .padding(10)
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
    }

    func isSelected(item: WaterPlant) -> Bool {
        return searchModel.selectedWaterPlantElements.contains(item)
    }
}

struct InfrastructureLowLevelFilterView_Previews: PreviewProvider {
    static var previews: some View {
        InfrastructureLowLevelFilterView()
            .environmentObject(SearchModel())
    }
}
