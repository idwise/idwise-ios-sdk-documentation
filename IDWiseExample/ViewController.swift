//
//  ViewController.swift
//  IDWiseExample
//
//  Created by Hussein Alshlash on 23.08.2021.
//

import UIKit
import IDWise

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        IDWiseSDK.start(customerID: YOUR_CUSTOMER_ID, delegate: self)
    }

}

extension ViewController:IDWiseSDKDelegate {
    func JourneyStarted(journeyID: String) {
        
    }
    
    func JourneyFinished() {
        
    }
    
    func JourneyCanceld() {
        
    }
    
    

}
