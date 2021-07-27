//
//  FuelEntryRequestManager.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import Foundation

struct FuelEntryRequestManager: APIRequest {
    
    var urlRequest: URLRequest {
        let urlString = Constant.URLBuilder.baseUrlString + Constant.URLBuilder.fuelEntries + Constant.Query.sortyByDescendingDate
        let url = URL(string: urlString)! // unit tested.
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            Constant.Header.auth : Constant.Token.authToken,
            Constant.Header.accountToken : Constant.Token.accountToken
        ]
        request.httpMethod = Constant.Method.get
        return request
    }
    
    func decodeResponse(data: Data) throws -> [FuelEntry] {
        let fuelEntryInfo = try JSONDecoder().decode([FuelEntry].self, from: data)
        return fuelEntryInfo
    }
}
