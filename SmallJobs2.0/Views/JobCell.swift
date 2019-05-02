//
//  JobCell.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/29/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class JobCell: UITableViewCell {
    
    
    @IBOutlet weak var jobImage: CircleImage!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(jobImage: UIImage, jobTitle: String, jobDate: String) {
        self.jobImage.image = jobImage
        self.jobTitle.text = jobTitle
        self.jobDate.text = jobDate
    }

}
