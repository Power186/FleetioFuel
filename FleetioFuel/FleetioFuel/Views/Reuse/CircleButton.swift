//
//  CloseButton.swift
//  FleetioFuel
//
//  Created by Scott on 7/27/21.
//

import SwiftUI

struct CircleButton: View {
    let image: String
    let imageColor: Color
    let imageScale: Image.Scale
    let padding: CGFloat
    let backgroundColor: Color
    
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: image)
                .imageScale(imageScale)
                .foregroundColor(imageColor)
                .padding(padding)
                .background(backgroundColor)
                .clipShape(Circle())
        })
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(image: "xmark", imageColor: .blue, imageScale: .medium, padding: 4, backgroundColor: .black, action: {})
    }
}
