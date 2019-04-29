//
//  OutlinedRoundedButton.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/28/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class OutlinedRoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7018407534)

    }

}
