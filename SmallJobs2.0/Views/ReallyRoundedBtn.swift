//
//  ReallyRoundedBtn.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/28/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class ReallyRoundedBtn: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2

    }

}
