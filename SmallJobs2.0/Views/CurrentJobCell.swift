//
//  CurrentJobCell.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/13/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class CurrentJobCell: UICollectionViewCell {
    
    
    var currentJob: CurrentJob! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var currentJobImage: UIImageView!
    @IBOutlet weak var currentJobTitle: UILabel!
    @IBOutlet weak var currentJobDesc: UILabel!
    @IBOutlet weak var currentJobPay: UILabel!
    @IBOutlet weak var currentJobDate: UILabel!
    @IBOutlet weak var currentJobDuration: UILabel!
    @IBOutlet weak var currentJobDistance: UILabel!
    
    
    private func updateUI() {
        currentJobImage.image = currentJob.image
        currentJobTitle.text = currentJob.title
        currentJobDesc.text = currentJob.description
        currentJobPay.text = currentJob.pay
        currentJobDate.text = currentJob.date
        currentJobDuration.text = currentJob.duration
        currentJobDistance.text = currentJob.distance
        }

}
