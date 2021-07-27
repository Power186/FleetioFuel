//
//  FuelEntry.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import Foundation

struct FuelEntry: Codable, Identifiable {
    var id: Int?
    var costPerMi: Double?
    var date: String?
    var vendorName: String?
    var vehicleName: String?
    var fuelType: String?
    var geolocation: GeoLocation?
    var gallons: String?
    var mpg: Double?
    var pricePerVolUnit: Double?
    var ref: String?
    var updated: String?
    var total: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case costPerMi = "cost_per_mi"
        case date
        case vendorName = "vendor_name"
        case vehicleName = "vehicle_name"
        case fuelType = "fuel_type_name"
        case geolocation
        case gallons = "us_gallons"
        case mpg = "mpg_us"
        case pricePerVolUnit = "price_per_volume_unit"
        case ref = "reference"
        case updated = "updated_at"
        case total = "total_amount"
    }
}
