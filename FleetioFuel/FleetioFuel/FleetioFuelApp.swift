//
//  FleetioFuelApp.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import SwiftUI

@main
struct FleetioFuelApp: App {
    @Environment(\.sizeCategory) var sizeCategory
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var fuelEntryVM: FuelEntryViewModel
    
    init() {
        let temporaryDirectory = NSTemporaryDirectory()
        let urlCache = URLCache(memoryCapacity: 30_000_000,
                                diskCapacity: 60_000_000,
                                diskPath: temporaryDirectory)
        URLCache.shared = urlCache
        
        CloudDefaults.shared.start()
        
        AudioManager.shared.playSound(file: "carEngine", ext: "wav")
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(FuelEntryViewModel())
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
                .onAppear(perform: {
                    UIApplication.shared.addTapGestureRecognizer()
                })
        }
    }
}
