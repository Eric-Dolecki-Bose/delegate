//
//  TestClass.swift
//  delegate
//
//  Created by Eric Dolecki on 5/31/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

protocol TestClassDelegate {
    func buttonWasPressed()
}

class TestClass: UIView {

    var testButton: UIButton!
    var delegate: TestClassDelegate?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        self.layer.cornerRadius = 8.0
        
        testButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        testButton.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        testButton.setTitle("TAP", for: .normal)
        testButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        testButton.setBackgroundColor(UIColor.blue,  forState: .normal)
        testButton.setBackgroundColor(UIColor.black, forState: .highlighted)
        testButton.setTitleColor(UIColor.white, for: .highlighted)
        testButton.setTitleColor(UIColor.white, for: .normal)
        testButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        self.addSubview(testButton)
    }
    
    @objc func buttonPressed(_ sender:UIButton) {
        delegate?.buttonWasPressed()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, forState controlState: UIControl.State) {
        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
            color.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
        }
        setBackgroundImage(colorImage, for: controlState)
    }
}
