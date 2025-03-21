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
    
    var journeyId = ""
    
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
        IDWiseDynamic.initialize(clientKey: CLIENT_KEY,theme: IDWiseTheme.systemDefault, onError: { _ in })
        
        let applicantDetails: [String:String] = [
            ApplicantDetailsKeys.FULL_NAME: "John Doe",
            ApplicantDetailsKeys.BIRTH_DATE: "2000-02-01",
            ApplicantDetailsKeys.SEX: "male"
        ]
        
        // If you want you can pass applicantDetails otherwise you can pass It as nil
                
        IDWiseDynamic.startJourney(flowId: JOURNEY_DEFINITION_ID, applicantDetails: applicantDetails, journeyCallbacks: self, stepCallbacks: self)
        
        // If you don't want to pass applicant details then method will look like this
        
       /*  IDWiseDynamic.startJourney(flowId: JOURNEY_DEFINITION_ID, applicantDetails: nil, journeyCallbacks: self, stepCallbacks: self) */
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
    func onJourneyBlocked(journeyBlockedInfo: IDWiseSDK.JourneyBlockedInfo) {
            // IDWise SDK already informed the user of the block reason
            // Optionally you can add extra logic here to do extra handling if you need
            // You can present a screen or an alert sheet to convey to user
            self.showCustomAlert(message: journeyBlockedInfo.blockedTransaction?.blockReasonMessage ?? "", handler: { _ in
                
            })
    }
    
    func onJourneyStarted(journeyStartedInfo: IDWiseSDK.JourneyStartedInfo) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyId = journeyStartedInfo.journeyId
        DispatchQueue.main.async {
            LoadingView.hide()
            // you can also start step when journey is started and this method is Invoked
            IDWiseDynamic.startStep(stepId: "STEP_ID")  // STEP_ID should be from your step definition
        }
    }
    
    func onJourneyResumed(journeyResumedInfo: IDWiseSDK.JourneyResumedInfo) {
        // Here you can save this journeyId to local storage or backend as you might need It again to resume journey
        self.journeyId = journeyResumedInfo.journeyId
        DispatchQueue.main.async {
            LoadingView.hide()
            // you can also start step when journey is resumed and this method is Invoked
            IDWiseDynamic.startStep(stepId: "STEP_ID")  // STEP_ID should be from your step definition
        }
    }
    
    func onJourneyCompleted(journeyCompletedInfo: IDWiseSDK.JourneyCompletedInfo) {
        // Here you can take any action after Journey is completed
    }
    
    func onJourneyCancelled(journeyCancelledInfo: IDWiseSDK.JourneyCancelledInfo) {
        // Here you can take any action after Journey is cancelled

    }
    
    func onError(error: IDWiseError) {
        // If some error occurs, this method will Invoke
       
    }
}
extension ViewController: IDWiseStepCallbacks {
    
    func onStepCaptured(stepCapturedInfo: IDWiseSDK.StepCapturedInfo) {
        print("Step captured Information of step with stepId :: \(stepCapturedInfo.stepId)")
        
        print("Front Step Original Image :: \(stepCapturedInfo.originalImage)")
        print("Back Step Original Image :: \(stepCapturedInfo.originalImageBack)")

        print("Front Step Cropped Image :: \(stepCapturedInfo.croppedImage)")
        print("Back Step Cropped Image :: \(stepCapturedInfo.croppedImageBack)")

        
    }
    
    func onStepResult(stepResultInfo: IDWiseSDK.StepResultInfo) {
        print("Step result Information of step with stepId \(stepResultInfo.stepId)")
    }
    
    func onStepCancelled(stepCancelledInfo: IDWiseSDK.StepCancelledInfo) {
        print("Step with \(stepCancelledInfo.stepId) cancelled")
    }
    
    func onStepSkipped(stepSkippedInfo: IDWiseSDK.StepSkippedInfo) {
        print("Step with \(stepSkippedInfo.stepId) skipped")
    }
   
}
