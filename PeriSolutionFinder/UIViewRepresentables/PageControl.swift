//
//  PageControl.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 25.12.22.
//

import SwiftUI


struct PageControl: UIViewRepresentable {

    var maxPages: Int
    var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.backgroundStyle = .minimal
        control.pageIndicatorTintColor = UIColor(Color("PeriRed").opacity(0.2))
        control.currentPageIndicatorTintColor = UIColor(Color("PeriRed"))
        control.numberOfPages = maxPages
        control.currentPage = currentPage
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}


