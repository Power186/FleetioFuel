//
//  Location.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
