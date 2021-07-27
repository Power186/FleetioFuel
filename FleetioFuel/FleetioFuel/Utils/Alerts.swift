//
//  Alerts.swift
//  FleetioFuel
//
//  Created by Scott on 7/22/21.
//

import SwiftUI

public final class UserAlert {
    static let shared = UserAlert()
    
    private init() {}
    
    func displayError(_ error: Error, title: String) {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: title,
                                                  message: error.localizedDescription,
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .default,
                                                  handler: nil))
                    UIApplication.shared.windows.first?.rootViewController?.present(alert,
                                                                                    animated: true,
                                                                                    completion: nil)
                }
            }
    
    func displayMessage(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title,
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
                                          style: .default,
                                          handler: nil))
            UIApplication.shared.windows.first?.rootViewController?.present(alert,
                                                                            animated: true,
                                                                            completion: nil)
        }
    }
}
