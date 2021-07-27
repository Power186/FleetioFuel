//
//  HomeView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

struct HomeView: View {
    @State private var showSettings = false
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemGreen]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemGreen]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView {
            Group {
                MainTabView()
            }
            .navigationBarTitle("Fleetio Fuel".localizedUppercase, displayMode: .inline)
            .navigationBarItems(trailing: settingsButton)
            .fullScreenCover(isPresented: $showSettings, content: {
                SettingsView()
            })
        }
    }
    
    private var settingsButton: some View {
        Button(action: {
            showSettings.toggle()
        }, label: {
            Image(systemName: "gear")
                .imageScale(.large)
                .foregroundColor(.gray)
        })
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FuelEntryViewModel())
    }
}
