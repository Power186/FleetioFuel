//
//  ListCellView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

struct ListCellView: View {
    @EnvironmentObject private var fuelVM: FuelEntryViewModel
    let entry: FuelEntry
    
    var body: some View {
        HStack(alignment: .center ,spacing: 16) {
            
            CircularProgressView(circleColor: entry.milesPerGallonColor,
                                 value: CGFloat(entry.milesPerGallonTotal.round(to: 2)),
                                 text: "\(entry.milesPerGallon.round(to: 1)) mpg")
            
            VStack(alignment: .leading, spacing: 10) {
                Text(entry.vehicle)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .scaledFont(name: "Avenir", size: 18)
                
                Text(fuelVM.setDate(fuelEntry: entry))
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .scaledFont(name: "Avenir", size: 16)
            }
            Spacer()
            
            Image(systemName: "signpost.right")
                .imageScale(.large)
                .foregroundColor(.blue)
        }
        .padding(10)
        .background(Color.gray.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .accessibilityElement(children: .combine)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(entry: FuelEntry())
            .environmentObject(FuelEntryViewModel())
    }
}
