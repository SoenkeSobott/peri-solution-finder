//
//  Bubble.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 10.03.23.
//

import SwiftUI

struct Bubble: Shape {
    private let radius: CGFloat
    private let tailSize: CGFloat

    let tipDownDistanceFromRight: CGFloat
    let tipUpDistanceFromRight: CGFloat
    let tipDownAgainDistanceFromRight: CGFloat

    init(radius: CGFloat = 10,
         tipDownDistanceFromRight: CGFloat = 50,
         tipUpDistanceFromRight: CGFloat = 40,
         tipDownAgainDistanceFromRight: CGFloat = 30) {
        self.radius = radius
        self.tailSize = 20
        self.tipDownDistanceFromRight = tipDownDistanceFromRight
        self.tipUpDistanceFromRight = tipUpDistanceFromRight
        self.tipDownAgainDistanceFromRight = tipDownAgainDistanceFromRight
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY - radius))
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: rect.maxX-tipDownAgainDistanceFromRight, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX-tipUpDistanceFromRight, y: rect.minY-10))
            path.addLine(to: CGPoint(x: rect.maxX-tipDownDistanceFromRight, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
        }
    }
}
