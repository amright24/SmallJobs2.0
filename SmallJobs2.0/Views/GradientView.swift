//
//  GradientView.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/12/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

        
        @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.1568627451, green: 0.3529411765, blue: 0.9725490196, alpha: 1) {
            didSet {
                self.setNeedsLayout()
            }
        }
        
        @IBInspectable var bottumColor: UIColor = #colorLiteral(red: 0.1568627451, green: 0.831372549, blue: 0.9725490196, alpha: 1) {
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


