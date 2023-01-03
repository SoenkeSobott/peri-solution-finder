//
//  NumberExtensions.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 03.01.23.
//

import Foundation

extension Float {
    func decimals(_ nbr: Int) -> String {
        String(self.formatted(.number.precision(.fractionLength(nbr))))
    }
}
