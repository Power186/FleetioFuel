//
//  Array+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/25/21.
//

import Foundation

extension Array {
    
    var toPrint: String {
        var str = ""
        for element in self {
            str += "\(element) \n \n "
        }
        return str
    }
}
