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
    
    var testClass: TestClass!
    var feedbackLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        testClass = TestClass(frame: CGRect(x: 50, y: 100, width: self.view.frame.width - 100, height: 100))
        testClass.delegate = self
        
        feedbackLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        feedbackLabel.textAlignment = .center
        feedbackLabel.textColor = UIColor.darkGray
        feedbackLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        feedbackLabel.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        self.view.addSubview(testClass)
        self.view.addSubview(feedbackLabel)
    }
    
    // Protocol method called from within TestClass. On button press.
    func buttonWasPressed()
    {
        feedbackLabel.text = "TAPPED"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75, execute: {
            self.feedbackLabel.text = ""
        })
    }
}

