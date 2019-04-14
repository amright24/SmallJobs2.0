//
//  JobsVC.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/11/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class JobsVC: UIViewController {

    private var currentJob = CurrentJob.createCurrentJob()
    private let cellReuseIdentifier = "currentJobCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

}




extension JobsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentJob.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CurrentJobCell
        
        cell.currentJob = currentJob[indexPath.item]
        
        return cell
        
    }

}





