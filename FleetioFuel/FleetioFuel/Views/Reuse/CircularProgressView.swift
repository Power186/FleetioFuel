//
//  CircularProgressView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

struct CircularProgressView: View {
    let circleColor: Color
    let value: CGFloat
    let text: String
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4)
                .opacity(0.3)
                .foregroundColor(circleColor)
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0, to: value)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .foregroundColor(circleColor)
                .rotationEffect(.degrees(-90))
            Text(text)
                .font(.caption)
                .bold()
                .foregroundColor(.primary)
        }
        .frame(width: 60, height: 60)
        .accessibilityElement(children: .combine)
    }
}
