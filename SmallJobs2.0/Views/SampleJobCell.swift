//
//  SampleJobCell.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/11/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class SampleJobCell: UICollectionViewCell {
    
    var sampleJob: SampleJob! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var sampleJobImage: UIImageView!
    @IBOutlet weak var sampleJobLbl: UILabel!
    
    private func updateUI() {
        sampleJobLbl?.text! = sampleJob.title
        sampleJobImage?.image! = sampleJob.image
    }
    
}
