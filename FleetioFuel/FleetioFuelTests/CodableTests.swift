//
//  CodableTests.swift
//  FleetioFuelTests
//
//  Created by Scott on 7/25/21.
//

import XCTest
import MapKit
@testable import FleetioFuel

class CodableTests: FleetioFuelTests {
    
    // MARK: - Test properties
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    // MARK: - Models
    
    func test_FuelEntryModel() throws {
        let fuelEntry = FuelEntry(id: 1,
                                  costPerMi: 0.75,
                                  date: nil,
                                  vendorName: "Name",
                                  vehicleName: "Vehicle name",
                                  fuelType: "Fuel Type",
                                  geolocation: nil,
                                  gallons: "",
                                  mpg: 0.0,
                                  pricePerVolUnit: 2.33,
                                  ref: "",
                                  updated: nil)
        let encodedData = try encoder.encode(fuelEntry)
        let decodedData = try decoder.decode(FuelEntry.self, from: encodedData)
        
        XCTAssertEqual(fuelEntry.costPerMi, decodedData.costPerMi) // actual
        XCTAssertEqual(fuelEntry.date, decodedData.date) // nil
    }
    
    func test_GeoLocationModel() throws {
        let geoLoc = GeoLocation(latitude: 39.9999,
                                 longitude: nil)
        let encodedData = try encoder.encode(geoLoc)
        let decodedData = try decoder.decode(GeoLocation.self, from: encodedData)
        
        XCTAssertEqual(geoLoc.latitude, decodedData.latitude) // actual
        XCTAssertEqual(geoLoc.longitude, decodedData.longitude) // nil
    }
    
}
