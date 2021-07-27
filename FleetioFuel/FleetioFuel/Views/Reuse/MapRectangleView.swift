//
//  MapRectangleView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI
import MapKit

struct MapRectangleView: View {
    let fuelEntry: FuelEntry
    @State private var region = MKCoordinateRegion()
    @State private var annotations = [Location]()
    
    init(_ fuelEntry: FuelEntry) {
        self.fuelEntry = fuelEntry
    }
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: annotations) { item in
            MapAnnotation(coordinate: item.coordinate) {
                MapAnnotationImageButton(includeInfo: .constant(false),
                                   fuelEntry: fuelEntry)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(width: UIScreen.main.bounds.width / 1.10,
               height: 200)
        .onAppear(perform: {
            setCoordinateRegion()
            setAnnotations()
        })
    }
    
    // MARK: - Private methods
    
    private func setCoordinateRegion() {
        var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: fuelEntry.geoLocation.lat,
                                                                                 longitude: fuelEntry.geoLocation.long),
                                                  span: MKCoordinateSpan(latitudeDelta: 0.04,
                                                                         longitudeDelta: 0.04))
        
        if fuelEntry.geoLocation.latitude == nil &&
            fuelEntry.geoLocation.longitude == nil {
            coordinateRegion = MKCoordinateRegion(center: Constant.MapView.usaCoordinate,
                                                  span: MKCoordinateSpan(latitudeDelta: Constant.MapView.usaSpanLat,
                                                                         longitudeDelta: Constant.MapView.usaSpanLong))
        }
        region = coordinateRegion
    }
    
    private func setAnnotations() {
        let mapAnnotations = [
            Location(coordinate: CLLocationCoordinate2D(latitude: fuelEntry.geoLocation.lat,
                                                        longitude: fuelEntry.geoLocation.long))
        ]
        annotations = mapAnnotations
    }
    
}

struct MapRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        MapRectangleView(FuelEntry())
    }
}
