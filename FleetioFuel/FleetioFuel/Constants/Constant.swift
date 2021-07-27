//
//  Constant.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import Foundation
import MapKit

struct Constant {
    
    // MARK: - App Ids

    struct AppId {
        // recommended apps
        static let slapdashEat = "1537287785"
    }

    // MARK: - Map

    struct MapView {
        // Alabama
        static let coordinate = CLLocationCoordinate2D(latitude: 33.51739,
                                                       longitude: -86.80821)
        static let latMeters: Double = 5000
        static let longMeters: Double = 5000
        
        // United States
        static let usaCoordinate = CLLocationCoordinate2D(latitude: 40.20170,
                                                          longitude: -98.55888)
        static let usaSpanLat: Double = 25.0
        static let usaSpanLong: Double = 25.0
    }

    // MARK: - Networking

    struct URLBuilder {
        static let baseUrlString = "https://secure.fleetio.com/api/v1/"
        static let fuelEntries = "fuel_entries"
    }

    struct Query {
        static let sortyByDescendingDate = "?q[s]=date+desc"
    }

    struct Header {
        static let auth = "Authorization"
        static let accountToken = "Account-Token"
    }

    struct Token {
        static let authToken = "Token token=a3ddc620b35b609682192c167de1b1f3f5100387"
        static let accountToken = "798819214b"
    }

    struct Method {
        static let get = "GET"
    }
}
