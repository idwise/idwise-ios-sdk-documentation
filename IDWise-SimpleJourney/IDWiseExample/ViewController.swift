//
//  ViewController.swift
//  IDWiseExample
//
//  Created by Hussein Alshlash on 23.08.2021.
//

import UIKit
import IDWise

class ViewController: UIViewController {
    
    // TODO: Replace the placeholder with your 'Client Key' provided by IDWise
    let CLIENT_KEY = "<CLIENT_KEY>"
    
    // TODO: Replace the placeholder with your 'Journey Definition ID' provided by IDWise
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction
    func startSDK(_ sender: UIButton) {
        IDWise.initialize(clientKey: CLIENT_KEY,theme: IDWiseSDKTheme.systemDefault) { err in
            // Deal with error here
            if let error = err {
                self.showCustomAlert(title: "Error \(error.code)", message: error.message, handler: { _ in

                })
            }
        }
        
        IDWise.startJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID,  locale: "en", journeyDelegate: self)

    }
   
    
    // MARK: - UI Handling Methods
    private func showCustomAlert(title: String = "Alert", message: String, handler: @escaping ((UIAlertAction)->Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: handler)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }


}


extension ViewController: IDWiseSDKJourneyDelegate {
    
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
