//
//  ExampleType.swift
//  ExampleModule
//
//  Created by Mian Najeeb on 08/03/2023.
//

import Foundation
import IDWise

class ExampleType {
    
    // TODO: Replace the placeholder with your 'Client Key' provided by IDWise
    let CLIENT_KEY = "<CLIENT_KEY>"
    
    // TODO: Replace the placeholder with your 'Journey Definition ID' provided by IDWise
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"
    
    
    func initialiseIDWiseSDKAndStartJourney() {
        IDWise.initialize(clientKey: CLIENT_KEY) { err in
            // Deal with error here
            if let error = err {
            }
        }
        
        IDWise.startJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID,  locale: "en", journeyDelegate: self)
    }
}

extension ExampleType: IDWiseSDKJourneyDelegate {
    
    func onError(error: IDWiseSDKError) {
        
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
