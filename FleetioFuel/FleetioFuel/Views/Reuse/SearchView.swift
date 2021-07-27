//
//  SearchView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var fuelEntryVM: FuelEntryViewModel
    let entries: [FuelEntry]
    
    var body: some View {
        RefreshableScrollView { complete in
            fuelEntryVM.getFuelEntries { _ in
                HapticsManager.shared.vibrate(for: .success)
                complete()
            }
        } content: {
            LazyVStack {
                ForEach(entries, id: \.uid) { entry in
                    NavigationLink(destination: EntryDetailView(entry)) {
                        ListCellView(entry: entry)
                            .id(entry.uid)
                    }
                }
            }
        }
    }
}
