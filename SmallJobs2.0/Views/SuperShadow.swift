//
//  SuperShadow.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/14/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//
import UIKit

class SuperShadow: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.60
        self.layer.shadowOffset = CGSize(width: 0,height: 5)
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1)
        setUpView()
        super.awakeFromNib()
    }
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = cornerRadius
    }
    
}
