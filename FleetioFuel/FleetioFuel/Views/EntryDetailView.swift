//
//  EntryDetailView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

struct EntryDetailViewControls {
    var isDetailsExpanded = true
    var isDatesExpanded = true
    var isCostsExpanded = true
}

struct EntryDetailView: View {
    @EnvironmentObject private var fuelVM: FuelEntryViewModel
    @State private var controls = EntryDetailViewControls()
    let fuelEntry: FuelEntry
    
    init(_ fuelEntry: FuelEntry) {
        self.fuelEntry = fuelEntry
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.opacity(0.25)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 14) {
                MapRectangleView(fuelEntry)
                    .shadow(color: .green, radius: 2)
                
                ScrollView(showsIndicators: false) {
                    DisclosureGroup(
                        isExpanded: $controls.isCostsExpanded,
                        content: {
                            HStack {
                                cardCircleView(labelTitle: "mpg",
                                               circleColor: fuelEntry.milesPerGallonColor,
                                               circleValue: CGFloat(fuelEntry.milesPerGallonTotal.round(to: 2)),
                                               circleText: "\(fuelEntry.milesPerGallon.round(to: 1))")
                                
                                cardCircleView(labelTitle: "per mi",
                                               circleColor: fuelEntry.costPerMileColor,
                                               circleValue: CGFloat(fuelEntry.costPerMileTotal.round(to: 2)),
                                               circleText: "\(fuelEntry.costPerMile.round(to: 2))".currencyFormat())
                                
                                cardCircleView(labelTitle: "per vol",
                                               circleColor: fuelEntry.pricePerVolUnitColor,
                                               circleValue: CGFloat(fuelEntry.pricePerVolUnitTotal.round(to: 2)),
                                               circleText: "\(fuelEntry.pricePerVolumeUnit.round(to: 2))".currencyFormat())
                                
                                cardCircleView(labelTitle: "total",
                                               circleColor: fuelEntry.totalAmountColor,
                                               circleValue: CGFloat(fuelEntry.totalAmountTotal.round(to: 2)),
                                               circleText: "\(fuelEntry.totalAmount.round(to: 2))".currencyFormat())
                            }
                        },
                        label: {
                            sectionTitle("By the Numbers")
                        })
                        .padding([.leading, .trailing])
                    
                    DisclosureGroup(
                        isExpanded: $controls.isDetailsExpanded,
                        content: {
                            cardView(labelTitle: "Vehicle name",
                                     text: fuelEntry.vehicle)
                            
                            cardView(labelTitle: "Vendor name",
                                     text: fuelEntry.vendor)
                            
                            cardView(labelTitle: "Fuel type",
                                     text: fuelEntry.fuel)
                            
                            cardView(labelTitle: "Gallons",
                                     text: fuelEntry.gallon)
                            
                            cardView(labelTitle: "Reference",
                                     text: fuelEntry.reference)
                        },
                        label: {
                            sectionTitle("Details")
                        })
                        .padding([.leading, .trailing])
                    
                    DisclosureGroup(
                        isExpanded: $controls.isDatesExpanded,
                        content: {
                            cardView(labelTitle: "Date",
                                     text: fuelVM.setDate(fuelEntry: fuelEntry))
                            
                            cardView(labelTitle: "Updated",
                                     text: fuelVM.setUpdatedDate(fuelEntry: fuelEntry))
                        },
                        label: {
                            sectionTitle("Dates")
                        })
                        .padding([.leading, .trailing])
                }
    
            }
            .accessibilityElement(children: .combine)
            .navigationBarItems(trailing: ShareSheetButton(share: fuelEntry))
            .padding(.top, 10)
        }
    }
    
    // MARK: - Private views
    
    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .fontWeight(.bold)
            .scaledFont(name: "Avenir", size: 20)
    }
    
    private func cardView(labelTitle: String, text: String) -> some View {
        VStack {
            HStack {
                Text(labelTitle)
                    .fontWeight(.semibold)
                    .scaledFont(name: "Avenir", size: 18)
                Spacer()
                Text(text)
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                    .scaledFont(name: "Avenir", size: 18)
            }
            .padding([.leading, .trailing], 8)
        }
        .cardBackgroundView(padding: 8,
                            color: Color(.systemGray6),
                            cornerRadius: 12)
        .padding([.leading, .trailing])
        .accessibilityElement(children: .combine)
    }
    
    private func cardCircleView(labelTitle: String, circleColor: Color, circleValue: CGFloat, circleText: String) -> some View {
        Group {
            VStack {
                Spacer()
                CircularProgressView(circleColor: circleColor.opacity(0.75),
                                     value: circleValue,
                                     text: circleText)
                Text(labelTitle)
                    .fontWeight(.semibold)
                    .scaledFont(name: "Avenir", size: 16)
                Spacer()
            }
            .padding([.leading, .trailing], 8)
        }
        .cardBackgroundView(padding: 0,
                            color: Color(.systemGray6),
                            cornerRadius: 12)
        .frame(width: UIScreen.main.bounds.width / 5)
        .accessibilityElement(children: .combine)
    }
    
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView(FuelEntry(id: 0,
                                  costPerMi: 0.56,
                                  date: "2021-05-25T14:47:00.000-05:00",
                                  vendorName: "Phillips 66",
                                  vehicleName: "Ford Taurus",
                                  fuelType: "Unleaded",
                                  geolocation: nil,
                                  gallons: "30.0",
                                  mpg: 35.034,
                                  pricePerVolUnit: 2.3334,
                                  ref: "",
                                  updated: "2021-04-25T14:40:00.000-03:00",
                                  total: 30.50))
            .environmentObject(FuelEntryViewModel())
    }
}
