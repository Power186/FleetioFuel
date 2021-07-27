//
//  AppStoreReviewManager.swift
//  FleetioFuel
//
//  Created by Scott on 7/26/21.
//

import StoreKit

enum AppStoreReviewManager {
    
    static func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
