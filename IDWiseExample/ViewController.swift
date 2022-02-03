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
        
        IDWise.initialize(clientKey: "<YOUR_CLIENT_KEY>") { error in
                // Deal with error here
                print(error?.code , error?.message)
        }
        
        IDWise.startJourney(journeyDefinitionId: "YOUR_CUSTOMER_ID", referenceNumber: "YOUR_REFERENCE_NO", locale: "en", delegate: self)
        
        
        
    }


}

extension ViewController:IDWiseSDKDelegate {
    func onError(error: IDWiseSDKError) {
        print(error.code , error.message)
    }
    
    
    func JourneyCancelled() {
        
    }
    
    func JourneyStarted(journeyID: String) {
        
    }
    
    func JourneyFinished() {
        
    }

}
