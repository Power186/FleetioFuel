//
//  GeoLocation+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import Foundation

extension GeoLocation {
    var lat: Double {
        return latitude ?? 0.0
    }
    var long: Double {
        return longitude ?? 0.0
    }
}
