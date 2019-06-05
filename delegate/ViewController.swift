//
//  ViewController.swift
//  delegate
//
//  Created by Eric Dolecki on 5/31/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

// Implement the TestClassDelegate like so:
class ViewController: UIViewController, TestClassDelegate {
    
    var testClass:TestClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testClass = TestClass(frame: CGRect(x: 50, y: 100, width: self.view.frame.width - 100, height: 100))
        // Self is VC scope for the protocol method below.
        testClass.delegate = self
        self.view.addSubview(testClass)
    }
    
    // Protocol method called from within TestClass' button.
    func buttonWasPressed() {
        print("button was pressed.")
    }
}

