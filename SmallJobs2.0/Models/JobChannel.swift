//
//  JobChannel.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/12/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class JobChannel {
    
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }

    static func createJobChannel() -> [JobChannel] {
        return [
            JobChannel(image: UIImage(named: "photography.png")!),
            JobChannel(image: UIImage(named: "lessons.png")!),
            JobChannel(image: UIImage(named: "modeling.png")!)
            
        ]
    }
}
