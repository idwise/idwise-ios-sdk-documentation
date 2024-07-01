//
//  ViewController.swift
//  IDWiseExample
//
//  Created by Hussein Alshlash on 23.08.2021.
//

import UIKit
import IDWiseSDK

class ViewController: UIViewController {
    
    // TODO: Replace the placeholder with your 'Client Key' provided by IDWise
    let CLIENT_KEY = "<CLIENT_KEY>"
    
    // TODO: Replace the placeholder with your 'Journey Definition ID' provided by IDWise
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"
    
    var journeyID = ""
    
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
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyID = journeyID

    }
    
    func JourneyCancelled() {
        
    }
    
    func JourneyStarted(journeyID: String) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyID = journeyID

    }
    
    func JourneyFinished() {
        
    }

}
