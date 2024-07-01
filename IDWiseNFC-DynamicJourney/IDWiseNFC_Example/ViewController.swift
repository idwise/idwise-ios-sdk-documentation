//
//  ViewController.swift
//  IDWiseNFC_Example
//
//  Created by Mian Najeeb on 08/03/2023.
//

import UIKit
import IDWiseNFC

class ViewController: UIViewController {
    
    // TODO: Replace the placeholder with your 'Client Key' provided by IDWise
    let CLIENT_KEY = "<YOUR_CLIENT_KEY>"
    
    // TODO: Replace the placeholder with your 'Journey Definition ID' provided by IDWise
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            LoadingView.show(message: "Loading... Please Wait")
        }
      //  addMenuWidgetView()
        IDWise.initialize(clientKey: CLIENT_KEY,theme: IDWiseSDKTheme.systemDefault, onError: { _ in })
        IDWise.startDynamicJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID, journeyDelegate: self, stepDelegate: self)
    }
    
    @IBAction func documentTapped(_ sender: Any) {
        IDWise.startStep(stepId: "STEP_ID") // STEP_ID should be from your step definition
    }
    
    @IBAction func selfieTapped(_ sender: Any) {
        IDWise.startStep(stepId: "STEP_ID") // STEP_ID should be from your step definition
    }
    func addMenuWidgetView() {
        let menuView = MenuWidgetView()
        self.view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            menuView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            menuView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }

}

extension ViewController: IDWiseSDKStepDelegate, IDWiseSDKJourneyDelegate {
    func onStepCaptured(stepId: Int, capturedImage: UIImage?) {
        
    }
    
    func onStepResult(stepId: Int, stepResult: IDWiseNFC.StepResult?) {
        
    }
    
    func onStepConfirmed(stepId: String) {
        
    }
    
    func JourneyStarted(journeyID: String) {
        DispatchQueue.main.async {
            LoadingView.hide()
            // you can also start step when journey is started and this method is Invoked
            IDWise.startStep(stepId: "STEP_ID")  // STEP_ID should be from your step definition

        }
    }
    
    func onJourneyResumed(journeyID: String) {
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
    
    func onJourneyInterrupted(journeyID: String) {
        
    }
    
    func onError(error: IDWiseNFC.IDWiseSDKError) {
        
    }
}
