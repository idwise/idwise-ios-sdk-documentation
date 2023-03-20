//
//  ViewController.swift
//  IDWiseDemo
//
//  Created by Mian Najeeb on 08/03/2023.
//

import UIKit
import ExampleModule

class ViewController: UIViewController {
    
    var exampleModule = ExampleModule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleModule.start()
    }
}

