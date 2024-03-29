//
//  Double+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/24/21.
//

import Foundation

extension Double {
    
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
