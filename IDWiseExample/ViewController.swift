//
//  ViewController.swift
//  IDWiseExample
//
//  Created by Hussein Alshlash on 23.08.2021.
//

import UIKit
import IDWise

class ViewController: UIViewController {
   

    
    @IBAction func startSDK(_ sender: UIButton) {
        
        IDWise.initialize(clientKey: "<YOUR_CLIENT_KEY>") { err in
                // Deal with error here
            if let error = err {
                self.showCustomAlert(title: "Error \(error.code)", message: error.message)
            }
        }
        
        IDWise.startJourney(journeyDefinitionId: "<YOUR_DEFINITION_JOURNEY_ID>",  locale: "en", journeyDelegate: self)

    }
    
    // MARK: - UI Handling Methods
    private func showCustomAlert(title: String = "Custom Alert" , message: String) {
        // Showing an Alert when a step completes
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
           
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }


}

extension ViewController:IDWiseSDKJourneyDelegate {
    func onError(error: IDWiseSDKError) {
        self.showCustomAlert(title: "Error \(error.code)", message: error.message)
    }
    func onJourneyResumed(journeyID: String) {
        
    }
    
    func JourneyCancelled() {
        
    }
    
    func JourneyStarted(journeyID: String) {
        
    }
    
    func JourneyFinished() {
        
    }

}
