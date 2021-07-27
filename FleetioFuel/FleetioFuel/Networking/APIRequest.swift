//
//  APIRequest.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import Foundation

protocol APIRequest {
    associatedtype Response = Data
    
    var urlRequest: URLRequest { get }
    func decodeResponse(data: Data) throws -> Response
}

enum NetworkError: Error {
    case error(err: String)
    case invalidResponse(response: String)
    case invalidData
    case decodingError(err: String)
}
