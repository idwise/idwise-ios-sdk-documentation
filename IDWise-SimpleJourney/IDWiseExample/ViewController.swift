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
    
    var journeyId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction
    func startSDK(_ sender: UIButton) {
        IDWise.initialize(clientKey: CLIENT_KEY,theme: IDWiseTheme.systemDefault) { err in
            // Deal with error here
            if let error = err {
                self.showCustomAlert(title: "Error \(error.code)", message: error.message, handler: { _ in

                })
            }
        }
        
        let applicantDetails: [String:String] = [
            ApplicantDetailsKeys.FULL_NAME: "John Doe",
            ApplicantDetailsKeys.BIRTH_DATE: "2000-02-01",
            ApplicantDetailsKeys.SEX: "male"
        ]
        
        // If you want you can pass applicantDetails otherwise you can pass It as nil
        
        // Make sure to provide ApplicantDetailsKeys.FULL_NAME as a mandatory field otherwise an error will be thrown
        
        IDWise.startJourney(flowId: JOURNEY_DEFINITION_ID,  locale: "en", applicantDetails: applicantDetails, journeyCallbacks: self)
        
        // If you don't want to pass applicant details then method will look like this
        
       /* IDWise.startJourney(flowId: JOURNEY_DEFINITION_ID,  locale: "en", applicantDetails: nil, journeyCallbacks: self) */

    }
   
    
    // MARK: - UI Handling Methods
    private func showCustomAlert(title: String = "Alert", message: String, handler: @escaping ((UIAlertAction)->Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: handler)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }


}


extension ViewController: IDWiseJourneyCallbacks {
    func onJourneyStarted(journeyStartedInfo: IDWiseSDK.JourneyStartedInfo) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyId = journeyStartedInfo.journeyId
    }
    
    func onJourneyResumed(journeyResumedInfo: IDWiseSDK.JourneyResumedInfo) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyId = journeyResumedInfo.journeyId
    }
    
    func onJourneyCompleted(journeyCompletedInfo: IDWiseSDK.JourneyCompletedInfo) {
        // Here you can take any action after Journey is completed
    }
    
    func onJourneyCancelled(journeyCancelledInfo: IDWiseSDK.JourneyCancelledInfo) {
        // Here you can take any action after Journey is cancelled

    }
    
    func onError(error: IDWiseError) {
        // showing error in an alert
        self.showCustomAlert(title: "Error \(error.code)", message: error.message, handler: { _ in
            
        })
    }

}
