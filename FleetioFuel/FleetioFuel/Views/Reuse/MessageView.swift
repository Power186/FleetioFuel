//
//  MessageView.swift
//  FleetioFuel
//
//  Created by Scott on 7/23/21.
//

import SwiftUI
import MessageUI

struct MessageView: UIViewControllerRepresentable {
    private typealias MessageDelegate = MFMessageComposeViewControllerDelegate & UINavigationControllerDelegate
    
    class Coordinator: NSObject, MessageDelegate {
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true, completion: nil)
        }
        
        let parent: MessageView
        
        init(_ parent: MessageView) {
            self.parent = parent
        }
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = MFMessageComposeViewController()
        
        guard MFMessageComposeViewController.canSendText(),
              MFMessageComposeViewController.canSendAttachments() else {
            HapticsManager.shared.vibrate(for: .error)
            return UIHostingController(rootView: ErrorMessageView().clipped())
        }
        HapticsManager.shared.vibrateForSelection()
        
        controller.messageComposeDelegate = context.coordinator
        controller.recipients = ["agentwinburn1@gmail.com"]
        controller.title = "Feedback"
        controller.subject = "Comment/Suggestion"
        controller.body = ""
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
