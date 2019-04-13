//
//  JobChannelCell.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/12/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class JobChannelCell: UICollectionViewCell {
    
        var image: UIImage
        let imageNames = ["home.png", "saved.png", "hires.png", "history.png"]
        let imageView: UIImageView = {
        
        let iv = UIImageView()
        iv.image = UIImage(named: "home.png")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.init(red: 235, green: 235, blue: 235, alpha: 1)
        return iv
    }()
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.init(red: 88, green: 110, blue: 251, alpha: 1) : UIColor.init(red: 40, green: 212, blue: 216, alpha: 1)
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.init(red: 88, green: 110, blue: 251, alpha: 1) : UIColor.init(red: 40, green: 212, blue: 216, alpha: 1)
        }
    }
    
        var jobChannel: JobChannel! {
            didSet {
                updateUI()
            }
        }
        
    @IBOutlet weak var jobChannelIcon: UIImageView!
    
        
        private func updateUI() {
            jobChannelIcon?.image! = jobChannel.image
        }
    
    
}

