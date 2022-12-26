//
//  PhotoView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI

struct PhotoView: View {

    let photoUrls: [String]
    @State private var photoIndex: Int = 0

    var body: some View {

        if (!photoUrls.isEmpty) {

            VStack {
                AsyncImage(url: URL(string: photoUrls[photoIndex])) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width*0.9)
                        .frame(maxHeight: .infinity)
                } placeholder: {
                    Spacer()
                    Text("Loading...")
                    Spacer()
                }

                Spacer()

                HStack {
                    Button(action: {
                        if (photoIndex > 0) {
                            photoIndex-=1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding(10)
                            .foregroundColor(Color("PeriRed"))
                    })

                    PageControl(maxPages: photoUrls.count, currentPage: photoIndex)

                    Button(action: {
                        if (photoIndex < photoUrls.count-1) {
                            photoIndex+=1
                        }
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding(10)
                            .foregroundColor(Color("PeriRed"))
                    })
                }
                .frame(width: UIScreen.main.bounds.width*0.9, height: 80)

            }
        } else {
            Text("No photos")
        }
        
    }
}


struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photoUrls: ["https://picsum.photos/seed/picsum/200/300", "https://picsum.photos/200/300/?blur"])
    }
}
