//
//  ViewController.swift
//  DynamicJourney_Example
//
//  Created by Mian Najeeb on 08/03/2023.
//

import UIKit
import IDWise

class ViewController: UIViewController {
    
    // TODO: Replace the placeholder with your 'Client Key' provided by IDWise
    let CLIENT_KEY = "<CLIENT_KEY>"
    
    // TODO: Replace the placeholder with your 'Journey Definition ID' provided by IDWise
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            LoadingView.show(message: "Loading... Please Wait")
        }
        addMenuWidgetView()
        IDWise.initialize(clientKey: CLIENT_KEY, onError: { _ in })
        IDWise.startDynamicJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID, journeyDelegate: self, stepDelegate: self)
        
    }
    
    func addMenuWidgetView() {
        // Uncomment this after releasing new IDWise version with MenuWidgetView
//        let menuView = MenuWidgetView()
//        self.view.addSubview(menuView)
//        menuView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            menuView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
//            menuView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
//            menuView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
//        ])
    }

}

extension ViewController: IDWiseSDKJourneyDelegate, IDWiseSDKStepDelegate {
    func JourneyStarted(journeyID: String) {
        
    }
    
    func onJourneyResumed(journeyID: String) {
        
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
