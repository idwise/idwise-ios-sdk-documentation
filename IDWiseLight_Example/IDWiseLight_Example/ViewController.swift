//
//  ViewController.swift
//  IDWiseLight_Example
//
//  Created by Mian Najeeb on 08/03/2023.
//

import UIKit
import IDWiseLight

class ViewController: UIViewController {

    let CLIENT_KEY = "<CLIENT_KEY>"
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction
    func startSDK(_ sender: UIButton) {
        IDWise.initialize(clientKey: CLIENT_KEY) { err in
            // Deal with error here
            if let error = err {
                self.showCustomAlert(title: "Error \(error.code)", message: error.message, handler: { _ in

                })
            }
        }
        
        IDWise.startJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID,  locale: "en", journeyDelegate: self)

    }
    
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
