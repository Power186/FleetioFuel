//
//  String+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/25/21.
//

import Foundation

extension String {
    
    func currencyFormat() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = .autoupdatingCurrent
            formatter.maximumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}
