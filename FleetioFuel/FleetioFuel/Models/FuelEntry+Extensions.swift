//
//  FuelEntry+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import SwiftUI

extension FuelEntry {
    var uid: Int {
        return id ?? 0
    }
    var costPerMile: Double {
        return costPerMi ?? 0.00
    }
    var currentDate: String {
        return date ?? ""
    }
    var vendor: String {
        return vendorName ?? ""
    }
    var vehicle: String {
        return vehicleName ?? ""
    }
    var fuel: String {
        return fuelType ?? ""
    }
    var geoLocation: GeoLocation {
        return geolocation ?? GeoLocation()
    }
    var gallon: String {
        return gallons ?? ""
    }
    var milesPerGallon: Double {
        return mpg ?? 0.0
    }
    var pricePerVolumeUnit: Double {
        return pricePerVolUnit ?? 0.00
    }
    var reference: String {
        return ref ?? ""
    }
    var lastUpdated: String {
        return updated ?? ""
    }
    var totalAmount: Double {
        return total ?? 0.00
    }
}

// Costs
extension FuelEntry {
    var milesPerGallonTotal: Double {
        return milesPerGallon / 100.0
    }
    var costPerMileTotal: Double {
        return costPerMile / 1.00
    }
    var pricePerVolUnitTotal: Double {
        return pricePerVolumeUnit / 5.00
    }
    var totalAmountTotal: Double {
        return totalAmount / 55.00
    }
}

// Cost color
extension FuelEntry {
    var milesPerGallonColor: Color {
        return milesPerGallon < 25.0 ? .red.opacity(0.75) : .green.opacity(0.75)
    }
    var costPerMileColor: Color {
        return costPerMile < 0.57 ? .green.opacity(0.75) : .red.opacity(0.75)
    }
    var pricePerVolUnitColor: Color {
        return pricePerVolumeUnit < 2.50 ? .green.opacity(0.75) : .red.opacity(0.75)
    }
    var totalAmountColor: Color {
        return totalAmount < 28.00 ? .green.opacity(0.75) : .red.opacity(0.75)
    }
}
