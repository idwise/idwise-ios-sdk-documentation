//
//  ViewController.swift
//  IDWiseExample
//
//  Created by Hussein Alshlash on 23.08.2021.
//

import UIKit
import IDWise

class ViewController: UIViewController {
   
    
    

    
    private var currentStep = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func startSDK(_ sender: UIButton) {
        
        IDWise.initialize(clientKey: "<YOUR_CLIENT_KEY>") { err in
                // Deal with error here
            if let error = err {
                self.showCustomAlert(title: "Error \(error.code)", message: error.message, handler: { _ in
                    
                })
            }
        }
        
        IDWise.startJourney(journeyDefinitionId: "<YOUR_DEFINITION_JOURNEY_ID>",  locale: "en", journeyDelegate: self)

    }
   
    
    // MARK: - UI Handling Methods
    private func showCustomAlert(title: String = "Custom Alert" , message: String, handler: @escaping ((UIAlertAction)->Void)) {
        // Showing an Alert when a step completes
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default,handler: handler)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }


}


extension ViewController:IDWiseSDKJourneyDelegate {
    func onError(error: IDWiseSDKError) {
        self.showCustomAlert(title: "Error \(error.code)", message: error.message, handler: { _ in
            
        })
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
