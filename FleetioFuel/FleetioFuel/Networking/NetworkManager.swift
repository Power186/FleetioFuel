//
//  NetworkManager.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import Foundation

public final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func sendRequest<Request: APIRequest>(_ request: Request,
                                          completion: @escaping (Result<Request.Response, NetworkError>) -> Void) {
        let task = URLSession.shared.dataTask(with: request.urlRequest) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.error(err: error?.localizedDescription ?? "")))
                return
            }
            guard response != nil else {
                completion(.failure(.invalidResponse(response: error?.localizedDescription ?? "")))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decodedResponse = try request.decodeResponse(data: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.decodingError(err: error.localizedDescription)))
            }
        }
        task.resume()
    }
}
