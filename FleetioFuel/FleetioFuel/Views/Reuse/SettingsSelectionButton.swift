//
//  SettingsButton.swift
//  FleetioFuel
//
//  Created by Scott on 7/26/21.
//

import SwiftUI

struct SettingsSelectionButton: View {
    let image: String
    let color: Color
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: image)
                    .imageScale(.large)
                    .foregroundColor(color)
                Spacer()
                Text(text)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                    .scaledFont(name: "Avenir", size: 18)
                Spacer()
            }
        })
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSelectionButton(image: "star", color: .yellow, text: "Star Button", action: {})
    }
}
