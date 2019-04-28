//
//  LocalJobCell.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/27/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class LocalJobCell: UICollectionViewCell {
    
    var localJob: LocalJob! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var localJobImage: UIImageView!
    @IBOutlet weak var localJobTitle: UILabel!
    @IBOutlet weak var localJobPay: UILabel!
    @IBOutlet weak var localJobRating: UIImageView!
    
    
    func updateUI() {
        localJobImage.image = localJob.image
        localJobTitle.text = localJob.title
        localJobPay.text = localJob.pay
        localJobRating.image = localJob.rating
    }
}
