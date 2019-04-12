//
//  UITabBarViewController.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/11/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class UITabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let newTabBarHeight = defaultTabBarHeight + 10.0
        
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        
        tabBar.frame = newFrame
    }

    

}
