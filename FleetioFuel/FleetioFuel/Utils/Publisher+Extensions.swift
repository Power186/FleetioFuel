//
//  Publisher+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/26/21.
//

import SwiftUI
import Combine

extension Publishers {
    
    // emits CGFloat values, never fails w/ error.
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        
        // noty will emit notification as a value.
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        // combine publishers above and set to subscribe.
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
