//
//  SearchBarView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var placeholder: String
    var keyBoard: UIKeyboardType
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .imageScale(.medium)
                TextField(placeholder, text: $searchText)
                    .scaledFont(name: "Avenir", size: 18)
                    .keyboardType(keyBoard)
            }
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.trailing)
                        .padding(.leading, 0)
                        .scaledFont(name: "Avenir", size: 18)
                }
            }
        }
    }
}
