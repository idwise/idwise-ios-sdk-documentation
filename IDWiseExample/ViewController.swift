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
        IDWiseSDK.start(customerID: YOUR_CUSTOMER_ID, delegate: self)
    }


}

extension ViewController:IDWiseSDKDelegate {
    func JourneyCanceled() {
        
    }
    
    func JourneyStarted(journeyID: String) {
        
    }
    
    func JourneyFinished() {
        
    }
    
   
    
    

}
