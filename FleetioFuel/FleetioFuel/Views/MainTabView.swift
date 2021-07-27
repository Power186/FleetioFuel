//
//  ContentView.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import SwiftUI

enum Tab: Int {
    case map, list
}

struct MainTabView: View {
    @State private var selectedTab = Tab.map
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
                MapView().tabItem {
                        tabBarItem(text: "Fuel Map",
                                   image: "location.circle")
                    }
                    .tag(Tab.map)
                
                ListView().tabItem {
                        tabBarItem(text: "Entries List",
                                   image: "list.number")
                    }
                    .tag(Tab.list)
            }
        .accentColor(.green)
    }
    
    // MARK: - Private views
    
    private func tabBarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(FuelEntryViewModel())
    }
}
