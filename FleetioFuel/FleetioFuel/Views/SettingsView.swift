//
//  SettingsView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI
import StoreKit

struct SettingsViewControls {
    var didSelectContactButton = false
    var didSelectRecommendAppButton = false
    var email = "agentwinburn1@gmail.com"
}

struct SettingsView: View {
    @Environment(\.presentationMode) var presentation
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var controls = SettingsViewControls()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Mode")) {
                    Picker("", selection: $isDarkMode) {
                        Text("Light")
                            .fontWeight(.semibold)
                            .scaledFont(name: "Avenir", size: 18)
                            .tag(false)
                        Text("Dark")
                            .fontWeight(.semibold)
                            .scaledFont(name: "Avenir", size: 18)
                            .tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.yellow.opacity(0.25))
                }
                
                Section(header: Text("Contact")) {
                    SettingsSelectionButton(image: "message",
                                   color: Color(.systemGreen),
                                   text: "Send comment or suggestion") {
                        controls.didSelectContactButton.toggle()
                    }
                    .sheet(isPresented: $controls.didSelectContactButton, content: {
                        MessageView()
                    })
                }
                
                Section(header: Text("Rate App")) {
                    SettingsSelectionButton(image: "star",
                                   color: Color(.systemYellow),
                                   text: "Rate your experience") {
                        AppStoreReviewManager.requestReview()
                    }
                }
                
                Section(header: Text("Recommended App")) {
                    SettingsSelectionButton(image: "apps.iphone",
                                   color: Color(.systemBlue),
                                   text: "Get Slapdash Eat") {
                        controls.didSelectRecommendAppButton.toggle()
                    }
                    .appStoreOverlay(isPresented: $controls.didSelectRecommendAppButton) {
                        SKOverlay.AppConfiguration(appIdentifier: Constant.AppId.slapdashEat,
                                                   position: .bottom)
                    }
                }
                
                SettingsSelectionButton(image: "checkmark",
                               color: Color(.systemOrange),
                               text: "Done") {
                    presentation.wrappedValue.dismiss()
                }
                
            }
            .navigationBarTitle("Settings".localizedUppercase)
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .accessibilityElement(children: .combine)
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
