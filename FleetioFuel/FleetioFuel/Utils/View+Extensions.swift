//
//  View+Extensions.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

extension View {
    
    func scaledFont(name: String, size: CGFloat) -> some View {
            self
                .modifier(ScaledFont(name: name, size: size))
    }
    
    public func gradient() -> LinearGradient {
        LinearGradient(gradient: Gradient(colors: [.blue, .green]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    public func cardBackgroundView(padding: CGFloat, color: Color, cornerRadius: CGFloat) -> some View {
        self
            .padding(padding)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
