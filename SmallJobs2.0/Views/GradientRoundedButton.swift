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
    
    override func layoutSubviews() {
        
        let button = UIButton()
        button.layer.borderWidth = 0.8
        button.layer.borderColor = #colorLiteral(red: 0.3450980392, green: 0.431372549, blue: 0.9843137255, alpha: 1)
    }
    
}
