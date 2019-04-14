//
//  BlackToClearFade.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/14/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

@IBDesignable
class BlackToClearFade: UIView {
    
    
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottumColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottumColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: -0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = self.bounds
        gradientLayer.locations = [0.0, 0.85]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
