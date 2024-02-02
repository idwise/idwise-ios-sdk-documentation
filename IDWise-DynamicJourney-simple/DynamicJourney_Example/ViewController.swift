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
        IDWise.startStep(stepId: "0")
    }
    
    @IBAction func verifySelfieTapped(_ sender: Any) {
        // stepID should be from your step definition
        IDWise.startStep(stepId: "2")
    }
    

}

extension ViewController: IDWiseSDKJourneyDelegate, IDWiseSDKStepDelegate {
    func onStepSkipped(stepId: String) {
        print("onStepSkipped")
    }
    

    func onStepCancelled(stepId: String) {
        print("onStepCancelled")
    }
    
    func JourneyStarted(journeyID: String) {
        print("JourneyStarted")
        buttonsStackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.isEnabled = true
            }
        }
        DispatchQueue.main.async {
            LoadingView.hide()
        }
    }
    
    func onJourneyResumed(journeyID: String) {
        print("onJourneyResumed")
        buttonsStackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.isEnabled = true
            }
        }
        DispatchQueue.main.async {
            LoadingView.hide()
        }
    }
    
    func JourneyFinished() {
        print("JourneyFinished")
    }
    
    func JourneyCancelled() {
        print("JourneyCancelled")
    }
    
    func onError(error: IDWiseSDKError) {
        print("onError")
        DispatchQueue.main.async {
            LoadingView.hide()
        }
    }
    
    func onStepCaptured(stepId: Int, capturedImage: UIImage?) {
        print("onStepCaptured")
    }
    
    func onStepResult(stepId: Int, stepResult: StepResult?) {
        print("onStepResult")
    }
    
    func onStepConfirmed(stepId: String) {
        print("onStepConfirmed")
    }
    
}
