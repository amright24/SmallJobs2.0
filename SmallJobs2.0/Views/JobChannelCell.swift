//
//  JobChannelCell.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/12/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class JobChannelCell: UICollectionViewCell {
    
    var jobChannel: JobChannel! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var jobChannelImage: UIImageView!
    
    
    private func updateUI() {
        jobChannelImage?.image = jobChannelImage.image
//        jobChannelImage?.image! = jobChannelImage.image
    }
    
}
