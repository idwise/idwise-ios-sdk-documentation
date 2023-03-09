//
//  ExampleType.swift
//  ExampleModule
//
//  Created by Mian Najeeb on 08/03/2023.
//

import Foundation
import IDWise

public class ExampleType {
    
    public static func initialiseIDWiseSDK() {
        IDWise.initialize(clientKey: "CLIENT_KEY", onError: { _ in })
    }
}
