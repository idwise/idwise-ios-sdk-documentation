//
//  ViewController.swift
//  IDWiseDemo
//
//  Created by Mian Najeeb on 08/03/2023.
//

import UIKit
import ExampleModule

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExampleType.initialiseIDWiseSDK()
    }
}

