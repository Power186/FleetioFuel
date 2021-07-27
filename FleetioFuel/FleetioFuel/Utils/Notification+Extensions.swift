//
//  Notification+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/26/21.
//

import SwiftUI

extension Notification {
    
    // uses noty userInfo for keyboard height.
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
