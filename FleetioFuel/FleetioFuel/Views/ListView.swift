//
//  ListView.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import SwiftUI

enum SearchTab: String, CaseIterable {
    case vehicles = "car"
    case date = "calendar"
    case costPerMi = "number"
}

struct ListViewControls {
    var searchText = ""
    var isSearching = false
    var selectedTab: SearchTab = .vehicles
    var entries = [FuelEntry]()
}

struct ListView: View {
    @EnvironmentObject private var fuelEntryVM: FuelEntryViewModel
    @State private var controls = ListViewControls()
    
    var body: some View {
        VStack(spacing: 10) {
            SearchBarView(searchText: $controls.searchText,
                          isSearching: $controls.isSearching,
                          placeholder: "Select below to search by type",
                          keyBoard: controls.selectedTab == SearchTab.costPerMi ? .decimalPad : .default)
                .padding(.top, 10)
            
            Picker(selection: $controls.selectedTab,
                   label: Text("")) {
                ForEach(SearchTab.allCases, id: \.self) {
                    Image(systemName: $0.rawValue)
                        .imageScale(.large)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.yellow.opacity(0.25))
            .padding(10)
            
            chosenSearchView(selected: controls.selectedTab,
                             entries: fuelEntryVM.entries)
                .padding([.leading, .trailing, .bottom], 10)
        }
        .accessibilityElement(children: .ignore)
        .accessibility(label: Text("List with \(fuelEntryVM.entries.count), search by type selected type: including vehicle name, date, and miles per gallon."))
    }
    
    // MARK: - Private views
    
    private func chosenSearchView(selected: SearchTab, entries: [FuelEntry]) -> some View {
        Group {
            switch selected {
            case .vehicles:
                SearchView(entries: fuelEntryVM.searchVehicles(with: controls.searchText))
                resultsLabel(results: fuelEntryVM.searchVehicles(with: controls.searchText).count)
                
            case .date:
                SearchView(entries: fuelEntryVM.searchDates(with: controls.searchText))
                resultsLabel(results: fuelEntryVM.searchDates(with: controls.searchText).count)
                
            case .costPerMi:
                SearchView(entries: fuelEntryVM.searchMilesPerGallon(with: controls.searchText))
                resultsLabel(results: fuelEntryVM.searchMilesPerGallon(with: controls.searchText).count)
            }
        }
        .onChange(of: controls.selectedTab, perform: { value in
            controls.searchText = ""
        })
    }
    
    private func resultsLabel(results count: Int) -> some View {
        Text("Results: \(count)")
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .scaledFont(name: "Avenir", size: 17)
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(FuelEntryViewModel())
    }
}
