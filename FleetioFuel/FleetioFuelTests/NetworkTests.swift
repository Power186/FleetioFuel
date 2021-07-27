//
//  NetworkTests.swift
//  FleetioFuelTests
//
//  Created by Scott on 7/25/21.
//

import XCTest
@testable import FleetioFuel

class NetworkTests: FleetioFuelTests {
    
    func testNetwork_FuelEntries() throws {
        
        let promise = expectation(description: "Fuel entries fetched.")
        var testModel: [FuelEntry] = []
        let modelRequest = FuelEntryRequestManager()
        
        NetworkManager.shared.sendRequest(modelRequest) { result in
            switch result {
            case .success(let responseData):
                testModel = responseData
                promise.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        
        wait(for: [promise], timeout: 5)
        XCTAssertNotNil(testModel, "Fuel entries failed.")
    }
    
}
