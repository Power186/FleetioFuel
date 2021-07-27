//
//  ActivityIndicator.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    typealias UIView = UIActivityIndicatorView
    
    var isAnimating: Bool = true
    var style: UIActivityIndicatorView.Style
    var color: UIColor
    
    var configuration = { (indicator: UIView) in }
    
    init(isAnimating: Bool, style: UIActivityIndicatorView.Style, color: UIColor, configuration: ((UIView) -> Void)? = nil) {
        self.isAnimating = isAnimating
        self.style = style
        self.color = color
        if let configuration = configuration {
            self.configuration = configuration
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        let view = UIView(style: style)
        view.color = color
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}
