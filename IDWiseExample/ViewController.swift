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
        IDWise.initialize(apiKey: "YOUR_API_KEY", apiSecret: "YOUR_API_SECRET") { isSucceeded, error in
            if isSucceeded && error == nil {
                IDWise.startJourney(journeyDefinitionId: "YOUR_CUSTOMER_ID", referenceNumber: "YOUR_REFERENCE_NO", locale: "en", delegate: self)
            }
            else {
                // Deal with error here
                print(isSucceeded ,error?.code , error?.message)
            }
        }
    }


}

extension ViewController:IDWiseSDKDelegate {
    func onError(errorMessage: IDWiseSDKError) {
        print(errorMessage.code , errorMessage.message)
    }
    
    
    func JourneyCancelled() {
        
    }
    
    func JourneyStarted(journeyID: String) {
        
    }
    
    func JourneyFinished() {
        
    }

}
