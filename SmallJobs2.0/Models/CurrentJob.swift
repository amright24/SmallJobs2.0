//
//  CurrentJob.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/13/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//
import UIKit

class CurrentJob {
    
    var title = ""
    var image: UIImage
    var description = ""
    var date = ""
    var duration = ""
    var pay = ""
    var distance = ""
    
    init(title: String, image: UIImage, description: String, date: String, duration: String, pay: String, distance: String) {
        self.title = title
        self.image = image
        self.description = description
        self.date = date
        self.duration = duration
        self.pay = pay
        self.distance = distance
    }
    
    static func createCurrentJob() -> [CurrentJob] {
        return [
            CurrentJob(title: "Home Cleaner", image: UIImage(named: "cleaningHome.png"), description: "Cleaning my SF property", date: "4/16/19", duration: "3 Hrs", pay: "$150", distance: "32mi"),
            CurrentJob(title: "Clean My Cool Van", image: UIImage(named: "vanCleaner.png"), description: "My adventure van needs some cleaning..", date: "4/26/19", duration: "3 Hrs", pay: "$200", distance: "56mi"),
            CurrentJob(title: "Tour Guid: Lake Tahoe", image: UIImage(named: "tourTheLake.png"), description: "Help us explore Lake Tahoe via boat", date: "7/3/19", duration: "4 Hrs", pay: "$169", distance: "89mi"),
            CurrentJob(title: "Photography Lessons", image: UIImage(named: "photographyLessons.png"), description: "Lets take some cool pics together", date: "5/6/19", duration: "5 Hrs", pay: "$350", distance: "102mi"),
            CurrentJob(title: "Train My Horses", image: UIImage(named: "horseTraining.png"), description: "My horses are in need of training", date: "8/16/19", duration: "15 Hrs", pay: "$1200", distance: "47mi"),
            CurrentJob(title: "Train Me To Be Fit", image: UIImage(named: "getMeInShape.png"), description: "Get in the me ripped in the gym", date: "9/7/19", duration: "34 Hrs", pay: "$750", distance: "89mi")
            
            
        ]
    }
}
