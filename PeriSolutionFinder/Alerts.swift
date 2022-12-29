//
//  Alerts.swift
//  PeriSolutionFinder
//
//  Created by Sönke Sobott on 29.12.22.
//

import SwiftUI

class Alerts {

    class func shared() -> Alerts {
        return Alerts()
    }

    func featureNotAvailableAlert() -> Alert {
        return Alert(title: Text("Feature not available"),
                     message: Text("This feature will be added in the near future."),
                     dismissButton: .default(Text("Got it!")))
    }
}
