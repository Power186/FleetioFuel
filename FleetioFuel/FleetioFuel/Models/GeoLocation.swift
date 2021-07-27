//
//  GeoLocation.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import Foundation

struct GeoLocation: Codable {
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
    }
}
