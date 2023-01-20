//
//  PhotoView.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 22.12.22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoView: View {
    let photoUrls: [String]
    @State private var selectedTab = 0

    var body: some View {
        if (!photoUrls.isEmpty) {
            VStack(spacing: 0) {
                ScrollView([.horizontal,.vertical], showsIndicators: false) {
                    WebImage(url: URL(string: photoUrls[selectedTab]))
                        .resizable()
                        .placeholder(Image(systemName: "photo"))
                        .placeholder {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color("PeriRed")))
                            Spacer()
                        }
                        .transition(.fade(duration: 0.5))
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width*0.9)
                }
                .cornerRadius(25, corners: [.topLeft, .topRight])

                ImageControl(selectedTab: $selectedTab, maxImages: photoUrls.count)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: 80)
            }
        } else {
            VStack(spacing: 20) {
                Text("Sorry!")
                    .text()
                Text("There are no photos for this project.")
                    .text()
            }
        }
    }
}


struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photoUrls: ["https://picsum.photos/seed/picsum/200/300", "https://picsum.photos/200/300/?blur"])
    }
}
