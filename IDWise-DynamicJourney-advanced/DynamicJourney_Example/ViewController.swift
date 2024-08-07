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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMenuWidgetView()
        
    }
    
    func addMenuWidgetView() {
        let menuView = MenuWidgetView()
        self.view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            menuView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            menuView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    @IBAction func testJourneyButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            LoadingView.show(message: "Loading... Please Wait")
        }
        IDWise.initialize(clientKey: CLIENT_KEY,theme: IDWiseSDKTheme.systemDefault, onError: { _ in })
        IDWise.startDynamicJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID, journeyDelegate: self, stepDelegate: self)
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
        
    }
    
    func onJourneyResumed(journeyID: String) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyID = journeyID

    }
    
    func JourneyFinished() {
        
    }
    
    func JourneyCancelled() {
        
    }
    
    func onError(error: IDWiseSDKError) {
        
    }
    
    func onStepCaptured(stepId: Int, capturedImage: UIImage?) {
        
    }
    
    func onStepResult(stepId: Int, stepResult: StepResult?) {
        
    }
    
    func onStepConfirmed(stepId: String) {

    }
    
}
