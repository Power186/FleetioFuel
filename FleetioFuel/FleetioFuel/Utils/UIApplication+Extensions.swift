//
//  UIApplication+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/25/21.
//

import SwiftUI

extension UIApplication {
    
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
                tapGesture.delegate = self
                tapGesture.name = "MyTapGesture"
                window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false // set to false to not detect tap during other gestures
    }
}
