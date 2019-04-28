//
//  LocalJob.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/27/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class LocalJob {
    var title = ""
    var image: UIImage
    var pay = ""
    var rating: UIImage
    
    init(title: String, image: UIImage, pay: String, rating: UIImage) {
        self.title = title
        self.image = image
        self.pay = pay
        self.rating = rating
    }
    
    static func createLocalJob() -> [LocalJob] {
        return [
        LocalJob(title: "Taking the dogs out to the beach", image: UIImage(named: "cleaningHome.png")!, pay: "$125", rating: UIImage(named: "star.png")!),
        LocalJob(title: "Lessons on wildlife photography", image: UIImage(named: "camel.png")!, pay: "$300", rating: UIImage(named: "star.png")!),
        LocalJob(title: "Taking me on a tour of the city", image: UIImage(named: "tourguide.png")!, pay: "$275", rating: UIImage(named: "star.png")!),
        LocalJob(title: "Give me tight rope walking lessons", image: UIImage(named: "tightrope.png")!, pay: "$2499", rating: UIImage(named: "star.png")!)
        ]
        
    }

}
