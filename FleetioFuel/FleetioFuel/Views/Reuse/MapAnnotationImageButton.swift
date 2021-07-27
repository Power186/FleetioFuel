//
//  MapAnnotation.swift
//  FleetioFuel
//
//  Created by Scott on 7/24/21.
//

import SwiftUI

struct MapAnnotationImageButton: View {
    
    @Binding var includeInfo: Bool
    @Binding var name: String
    @Binding var total: Double
    @Binding var amountTotal: Double
    @Binding var amountColor: Color
    @Binding var pricePerGal: Double
    @Binding var pricePerGalTotal: Double
    @Binding var pricePerGalColor: Color
    
    @State private var isSelected = false
    
    let fuelEntry: FuelEntry
    
    init(includeInfo: Binding<Bool>, name: Binding<String>? = nil, total: Binding<Double>? = nil, amountTotal: Binding<Double>? = nil, amountColor: Binding<Color>? = nil, pricePerGal: Binding<Double>? = nil, pricePerGalTotal: Binding<Double>? = nil, pricePerGalColor: Binding<Color>? = nil, fuelEntry: FuelEntry) {
        self._includeInfo = includeInfo
        self._name = name ?? .constant("")
        self._total = total ?? .constant(0.0)
        self._amountTotal = amountTotal ?? .constant(0.00)
        self._amountColor = amountColor ?? .constant(.clear)
        self._pricePerGal = pricePerGal ?? .constant(0.00)
        self._pricePerGalTotal = pricePerGalTotal ?? .constant(0.00)
        self._pricePerGalColor = pricePerGalColor ?? .constant(.clear)
        self.fuelEntry = fuelEntry
    }
    
    var body: some View {
        if includeInfo == true {
            VStack(spacing: 14) {
                infoButton()
                annotationImage()
            }
            .cardBackgroundView(padding: 4,
                                color: Color(.systemGray4),
                                cornerRadius: 10)
        } else {
            annotationImage()
        }
    }
    
    // MARK: - Private views
    
    private func infoButton() -> some View {
        Button(action: {
            if isSelected != true {
                HapticsManager.shared.vibrateForSelection()
                // name
                name = fuelEntry.vehicle
                // total
                total = fuelEntry.totalAmount
                amountTotal = fuelEntry.totalAmountTotal
                amountColor = fuelEntry.totalAmountColor
                // price per vol
                pricePerGal = fuelEntry.pricePerVolumeUnit
                pricePerGalTotal = fuelEntry.pricePerVolUnitTotal
                pricePerGalColor = fuelEntry.pricePerVolUnitColor
            }
            // selection
            isSelected.toggle()
        }, label: {
            Image(systemName: "info.circle")
                .imageScale(.large)
                .foregroundColor(Color(isSelected ? .systemRed : .systemBlue))
        })
    }
    
    private func annotationImage() -> some View {
        Image(systemName: "mappin.circle")
            .imageScale(.large)
            .foregroundColor(.primary)
            .background(gradient())
            .clipShape(Circle())
    }
    
}

struct MapAnnotationImageButton_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationImageButton(includeInfo: .constant(true), fuelEntry: FuelEntry())
    }
}
