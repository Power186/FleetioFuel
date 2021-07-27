//
//  ShareSheetView.swift
//  FleetioFuel
//
//  Created by Scott on 7/25/21.
//

import SwiftUI

struct ShareSheetButton: View {
    @EnvironmentObject private var fuelVM: FuelEntryViewModel
    let fuelEntry: FuelEntry
    
    init(share fuelEntry: FuelEntry) {
        self.fuelEntry = fuelEntry
    }
    
    var body: some View {
        Button(action: {
            HapticsManager.shared.vibrateForSelection()
            shareInfo()
        }, label: {
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
                .foregroundColor(.green.opacity(0.75))
        })
    }
    
    private func shareInfo() {
        let title = "Fleetio Fuel: Entry"
        let date = "🗓 \(fuelVM.setDate(fuelEntry: fuelEntry))"
        let name = "🚗 \(fuelEntry.vehicle)"
        let mpg = "⛽️ \(fuelEntry.milesPerGallon.round(to: 1)) mpg"
        let total = "💸 " + "\(fuelEntry.totalAmount.round(to: 2))".currencyFormat()
        
        
        let sharedItems = [title, date, name, mpg, total].toPrint
        
        let av = UIActivityViewController(activityItems: [sharedItems],
                                          applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av,
                                                                        animated: true,
                                                                        completion: nil)
    }
    
}

struct ShareSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetButton(share: FuelEntry())
            .environmentObject(FuelEntryViewModel())
    }
}
