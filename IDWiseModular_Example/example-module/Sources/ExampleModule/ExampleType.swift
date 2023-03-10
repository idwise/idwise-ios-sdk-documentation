//
//  ExampleType.swift
//  ExampleModule
//
//  Created by Mian Najeeb on 08/03/2023.
//

import Foundation
import IDWise

public class ExampleType {
    
    let CLIENT_KEY = "<CLIENT_KEY>"
    let JOURNEY_DEFINITION_ID = "<JOURNEY_DEFINITION_ID>"
    
    public init() {}
    
    public func initialiseIDWiseSDKAndStartJourney() {
        IDWise.initialize(clientKey: CLIENT_KEY) { err in
            // Deal with error here
            if let error = err {
            }
        }
        
        IDWise.startJourney(journeyDefinitionId: JOURNEY_DEFINITION_ID,  locale: "en", journeyDelegate: self)
    }
}

extension ExampleType: IDWiseSDKJourneyDelegate {
    
    public func onError(error: IDWiseSDKError) {
        
    }
    
    public func onJourneyResumed(journeyID: String) {
        
    }
    
    public func JourneyCancelled() {
        
    }
    
    public func JourneyStarted(journeyID: String) {
        
    }
    
    public func JourneyFinished() {
        
    }

}
