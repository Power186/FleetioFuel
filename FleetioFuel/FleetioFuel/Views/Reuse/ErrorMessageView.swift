//
//  ErrorMessageView.swift
//  FleetioFuel
//
//  Created by Scott on 7/25/21.
//

import SwiftUI

struct ErrorMessageView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 14) {
                    Text("Swipe down to dismiss")
                        .fontWeight(.semibold)
                        .scaledFont(name: "Avenir", size: 18)
                    Image(systemName: "arrow.down")
                        .imageScale(.medium)
                }
                .foregroundColor(.black)
                .padding(.top, 20)
                
                errorMessage()
                .padding(.top, 100)
                
                Spacer()
                
            }
        }
        .colorScheme(isDarkMode ? .dark : .light)
        .accessibilityElement(children: .combine)
    }
    
    // MARK: - Private views
    
    private func errorMessage() -> some View {
        VStack(spacing: 20) {
            Image(systemName: "message")
                .resizable()
                .frame(width: 70, height: 70)
                .foregroundColor(.green)
            
            VStack(spacing: 16) {
                Text("Sorry!")
                    .fontWeight(.bold)
                    .scaledFont(name: "Avenir", size: 24)
                Text("Please set up or enable the iMessage app on your device to send a message.")
                    .fontWeight(.semibold)
                    .scaledFont(name: "Avenir", size: 18)
            }
            .foregroundColor(.black)
            .cardBackgroundView(padding: 10,
                                color: .orange.opacity(0.45),
                                cornerRadius: 12)
            .padding([.leading, .trailing], 10)
        }
    }
    
}

struct ErrorMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessageView()
    }
}
