//
//  ViewController.swift
//  DynamicJourney_Example
//
//  Created by Mian Najeeb on 08/03/2023.
//

import UIKit
import IDWiseSDK

class ViewController: UIViewController {
    
    // TODO: Replace the placeholder with your 'Client Key' provided by IDWise
    let CLIENT_KEY = "<CLIENT_KEY>"
    
    // TODO: Replace the placeholder with your 'Journey Definition ID' provided by IDWise
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"
    
    var journeyID = ""
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsStackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.isEnabled = false
            }
        }
        
    }
    
    @IBAction func testJourneyButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            LoadingView.show(message: "Loading...Please Wait")
        }
        IDWise.initialize(clientKey: CLIENT_KEY,theme: IDWiseSDKTheme.systemDefault, onError: { _ in })
        IDWise.startDynamicJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID, journeyDelegate: self, stepDelegate: self)
        
    }
    
    @IBAction func verifyIDDocumentTapped(_ sender: Any) {
        // stepID should be from your step definition
        IDWise.startStep(stepId: "STEP_ID")
    }
    
    @IBAction func verifySelfieTapped(_ sender: Any) {
        // stepID should be from your step definition
        IDWise.startStep(stepId: "STEP_ID")
    }
    

}

extension ViewController: IDWiseSDKJourneyDelegate, IDWiseSDKStepDelegate {
    func onStepSkipped(stepId: String) {
        
    }
    

    func onStepCancelled(stepId: String) {
        
    }
    
    func JourneyStarted(journeyID: String) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyID = journeyID

        buttonsStackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.isEnabled = true
            }
        }
        DispatchQueue.main.async {
            LoadingView.hide()
            // you can also start step when journey is started and this method is Invoked
            IDWise.startStep(stepId: "STEP_ID")  // STEP_ID should be from your step definition
        }
    }
    
    func onJourneyResumed(journeyID: String) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyID = journeyID

        buttonsStackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.isEnabled = true
            }
        }
        DispatchQueue.main.async {
            LoadingView.hide()
            // you can also start step when journey is resumed and this method is Invoked
            IDWise.startStep(stepId: "STEP_ID")  // STEP_ID should be from your step definition

        }
    }
    
    func JourneyFinished() {
        
    }
    
    func JourneyCancelled() {
        
    }
    
    func onError(error: IDWiseSDKError) {
        DispatchQueue.main.async {
            LoadingView.hide()
        }
    }
    
    func onStepCaptured(stepId: Int, capturedImage: UIImage?) {
        
    }
    
    func onStepResult(stepId: Int, stepResult: StepResult?) {
        
    }
    
    func onStepConfirmed(stepId: String) {

    }
    
}
