//
//  MapView.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import SwiftUI
import MapKit
import Combine

struct MapViewControls {
    var region = MKCoordinateRegion(center: Constant.MapView.coordinate,
                                    latitudinalMeters: Constant.MapView.latMeters,
                                    longitudinalMeters: Constant.MapView.longMeters)
    var searchText = ""
    var isSearching = false
    var holder = "Search by vehicle name"
    
    var vehicleName = ""
    var total: Double = 0.0
    var totalAmountToal: Double = 0.0
    var totalColor: Color = .clear
    var pricePerGal: Double = 0.0
    var costPerGalTotal: Double = 0.0
    var pricePerGalColor: Color = .clear
    
    var keyboardHeight: CGFloat = 0
}

struct MapView: View {
    @EnvironmentObject private var fuelEntryVM: FuelEntryViewModel
    @State private var controls = MapViewControls()
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            ZStack(alignment: .top) {
                // Map view
                Map(coordinateRegion: $controls.region,
                    annotationItems: fuelEntryVM.searchVehicles(with: controls.searchText)) { entry in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: entry.geoLocation.lat,
                                                                     longitude: entry.geoLocation.long)) {
                        NavigationLink(destination: EntryDetailView(entry)) {
                            MapAnnotationImageButton(includeInfo: .constant(true),
                                               name: $controls.vehicleName,
                                               total: $controls.total,
                                               amountTotal: $controls.totalAmountToal,
                                               amountColor: $controls.totalColor,
                                               pricePerGal: $controls.pricePerGal,
                                               pricePerGalTotal: $controls.costPerGalTotal,
                                               pricePerGalColor: $controls.pricePerGalColor,
                                               fuelEntry: entry)
                                .padding(.bottom, controls.keyboardHeight) // move view up with keyboard.
                        }
                    }
                }

                // Search bar
                SearchBarView(searchText: $controls.searchText,
                              isSearching: $controls.isSearching,
                              placeholder: controls.holder,
                              keyBoard: .default)
                    .padding(.top, 10)
                
                // Selection info
                selectionInfoView()
                    .padding(.top, 60)
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(8)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height / 1.25)
            .shadow(color: .green, radius: 4)
            .overlay(
                configureLoadingView()
            )
            .onReceive(Publishers.keyboardHeight) { controls.keyboardHeight = $0 } // sets keyboard height from noty.
            .accessibilityElement(children: .ignore)
            .accessibility(label: Text("Birmingham, Alabama, \(fuelEntryVM.entries.count) fuel entries, search by vehicle name or select from the map."))
            
        }

    }
    
    // MARK: - Private views
    
    private func selectionInfoView() -> some View {
        Group {
            if !controls.vehicleName.isEmpty {
                    VStack {
                        HStack(alignment: .top) {
                            Text(controls.vehicleName)
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                                .scaledFont(name: "Avenir", size: 15)
                            Spacer()
                            CircleButton(image: "xmark.circle",
                                         imageColor: .primary,
                                         imageScale: .medium,
                                         padding: 2,
                                         backgroundColor: Color(.systemGray5)) {
                                controls.vehicleName = ""
                            }
                        }
                        
                        HStack {
                            Spacer()
                            VStack {
                                CircularProgressView(circleColor: controls.pricePerGalColor,
                                                     value: CGFloat(controls.costPerGalTotal.round(to: 2)),
                                                 text: "\(controls.pricePerGal)".currencyFormat())
                                Text("per vol")
                                    .scaledFont(name: "Avenir", size: 14)
                            }
                            Spacer()
                            VStack {
                                CircularProgressView(circleColor: controls.totalColor,
                                                     value: CGFloat(controls.totalAmountToal.round(to: 2)),
                                                     text: "\(controls.total)".currencyFormat())
                                Text("mpg")
                                    .scaledFont(name: "Avenir", size: 14)
                            }
                            Spacer()
                        }
                    }
                    .animation(.default)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .cardBackgroundView(padding: 8,
                                        color: Color(.systemGray4),
                                    cornerRadius: 10)
                    .accessibilityElement(children: .combine)
            }
        }
    }
    
    private func configureLoadingView() -> some View {
        Group {
            if fuelEntryVM.isLoading {
                VStack {
                    ActivityIndicator(isAnimating: true,
                                      style: .medium,
                                      color: .systemOrange)
                    Text("Getting entries")
                        .scaledFont(name: "Avenir", size: 16)
                }
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                .animation(.default)
            }
        }
        .accessibilityElement(children: .combine)
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(FuelEntryViewModel())
    }
}
