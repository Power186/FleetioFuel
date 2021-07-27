//
//  FuelEntryViewModel.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import Foundation

typealias EntriesComplete = (Bool) -> Void

public final class FuelEntryViewModel: ObservableObject {
    @Published var entries: [FuelEntry] = []
    @Published var isLoading = true
    
    @Published private var entryDate: String = ""
    private let dateForm = DateFormat.shared
    
    init() {
        configureLoading()
    }
    
    private func configureLoading() {
        getFuelEntries { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                HapticsManager.shared.vibrate(for: .success)
                self.isLoading = false
            }
        }
    }
    
    func getFuelEntries(completion: @escaping EntriesComplete) {
        let manager = FuelEntryRequestManager()
        
        NetworkManager.shared.sendRequest(manager) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.entries = response
                    completion(true)
                }
            case .failure(let error):
                UserAlert.shared.displayError(error,
                                              title: "Failed to load entries. Please check network connection and try again.")
                completion(false)
            }
        }
    }
    
    func searchVehicles(with searchText: String) -> [FuelEntry] {
        return entries.filter {
            searchText.isEmpty ? true :
            $0.vehicle.lowercased().localizedStandardContains(searchText.lowercased())
        }
    }
    
    func searchDates(with searchText: String) -> [FuelEntry] {
        return entries.filter {
            searchText.isEmpty ? true :
                setDate(fuelEntry: $0).lowercased().localizedStandardContains(searchText.lowercased())
        }
    }
    
    func searchMilesPerGallon(with searchText: String) -> [FuelEntry] {
        return entries.filter {
            searchText.isEmpty ? true :
                "\($0.milesPerGallon.round(to: 1))".lowercased().localizedStandardContains(searchText.lowercased())
        }
    }
    
    func setDate(fuelEntry: FuelEntry) -> String {
        let date = dateForm.fetchedDateFormatter.date(from: fuelEntry.date ?? "") ?? Date()
        let dateString = dateForm.dateFormat.string(from: date)
        
        return entryDate.appending(dateString)
    }
    
    func setUpdatedDate(fuelEntry: FuelEntry) -> String {
        let date = dateForm.fetchedDateFormatter.date(from: fuelEntry.lastUpdated) ?? Date()
        let dateString = dateForm.dateFormat.string(from: date)
        
        return entryDate.appending(dateString)
    }
    
}
