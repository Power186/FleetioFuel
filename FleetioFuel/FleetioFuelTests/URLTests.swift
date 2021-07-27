//
//  URLTests.swift
//  FleetioFuelTests
//
//  Created by Scott on 7/25/21.
//

import XCTest
@testable import FleetioFuel

class URLTests: FleetioFuelTests {
    
    // MARK: - Test methods
    
    func compareUrlStrings(urlString: String, testUrlString: String) {
        XCTAssertEqual(urlString, testUrlString)
    }
    
    // MARK: - Tests
    
    func test_BaseUrlString() {
        compareUrlStrings(urlString: Constant.URLBuilder.baseUrlString,
                          testUrlString: "https://secure.fleetio.com/api/v1/")
    }
    
    func test_FuelEntriesUrlString() {
        compareUrlStrings(urlString: Constant.URLBuilder.baseUrlString + Constant.URLBuilder.fuelEntries,
                          testUrlString: "https://secure.fleetio.com/api/v1/fuel_entries")
    }
    
    func test_SortByDescendingString() {
        compareUrlStrings(urlString: Constant.URLBuilder.baseUrlString + Constant.URLBuilder.fuelEntries + Constant.Query.sortyByDescendingDate,
                          testUrlString: "https://secure.fleetio.com/api/v1/fuel_entries?q[s]=date+desc")
    }
    
}
