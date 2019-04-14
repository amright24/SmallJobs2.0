//
//  GradientRoundedButton.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/14/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

@IBDesignable
class GradientRoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = cornerRadius
    }
    
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.3529411765, green: 0.2449700342, blue: 0.968627451, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottumColor: UIColor = #colorLiteral(red: 0.231372549, green: 0.6745098039, blue: 0.9764705882, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottumColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
