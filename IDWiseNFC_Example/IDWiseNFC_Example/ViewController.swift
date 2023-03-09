//
//  ViewController.swift
//  IDWiseNFC_Example
//
//  Created by Mian Najeeb on 08/03/2023.
//

import UIKit
import IDWiseNFC

class ViewController: UIViewController {
    
    let CLIENT_KEY = "<YOUR-CLIENT-KEY>"
    let JOURNEY_DEFINITION_ID = "<JOURNEY-DEFINATION-ID>"

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
        }
    }
    
    func onJourneyResumed(journeyID: String) {
        DispatchQueue.main.async {
            LoadingView.hide()
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
