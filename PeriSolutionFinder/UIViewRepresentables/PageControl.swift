//
//  PageControl.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 25.12.22.
//

import SwiftUI
import Foundation

struct PageControl: UIViewRepresentable {

    var maxPages: Int
    let control = UIPageControl()
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        control.backgroundStyle = .minimal
        control.pageIndicatorTintColor = UIColor(Color("PeriRed").opacity(0.2))
        control.currentPageIndicatorTintColor = UIColor(Color("PeriRed"))
        control.numberOfPages = maxPages
        control.currentPage = currentPage
        control.addTarget(context.coordinator, action: #selector(context.coordinator.hadnleTapOnPageControl), for: .valueChanged)
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }


    class Coordinator: NSObject {

        var parent: PageControl

        init(_ parent: PageControl) {
            self.parent = parent
        }

        @objc func hadnleTapOnPageControl() {
            parent.currentPage = parent.control.currentPage
        }
    }
}



