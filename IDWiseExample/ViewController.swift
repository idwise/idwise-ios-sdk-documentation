//
//  ViewController.swift
//  IDWiseExample
//
//  Created by Hussein Alshlash on 23.08.2021.
//

import UIKit
import IDWise

class ViewController: UIViewController {
   
    
    

    @IBOutlet weak var startDynamicJourney: UIButton!
    
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
    @IBAction func startDynamicJourney(_ sender: Any) {
        IDWise.initialize(clientKey: "<YOUR_CLIENT_KEY>") { err in
                // Deal with error here
            if let error = err {
                self.showCustomAlert(title: "Error \(error.code)", message: error.message, handler: { _ in
                    
                })
            }
        }
        
        IDWise.startDynamicJourney(journeyDefinitionId: "<YOUR_DEFINITION_JOURNEY_ID>",locale: "en", journeyDelegate: self, stepDelegate: self)
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

extension ViewController: IDWiseSDKStepDelegate {
    func onStepConfirmed(stepId: String) {
        LoadingView.hide()
        print("Step Confirmed")
    }
    
    // Handling UI on each step capture and completion
    func onStepResult(stepId: Int,stepResult: StepResult?) {
        LoadingView.hide()
        // Showing Custom Alert using Step Result Information
        if let reasonCode = stepResult?.failureReasonCode {
            self.showCustomAlert(title: (stepResult!.document?.documentType) ?? "Selfie",message: "This verification step is completed with \(reasonCode)", handler: { _ in
                LoadingView.show()
                IDWise.confirmStep(stepId: String(self.currentStep))
                
            })
        } else {
            self.showCustomAlert(title: (stepResult!.document?.documentType) ?? "Selfie",message: "This verification step is completed!", handler: { _ in
                LoadingView.show()
                IDWise.confirmStep(stepId: String(self.currentStep))
                
            })
        }
      
        
    }
    
    func onStepCaptured(stepId: Int, capturedImage: UIImage?) {
        // Handling UI
        LoadingView.show()
        // Show Loading Indicator or show captured Image on screen
       
       

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
