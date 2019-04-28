//
//  FirstViewController.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/11/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    private var sampleJob = SampleJob.createSampleJob()
    private var localJob = LocalJob.createLocalJob()
    
    
    @IBOutlet weak var SampleJobCollectionView: UICollectionView!
    @IBOutlet weak var LocalJobCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SampleJobCollectionView.delegate = self
        LocalJobCollectionView.delegate = self
        
        SampleJobCollectionView.dataSource = self
        LocalJobCollectionView.dataSource = self
    }
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.SampleJobCollectionView {
            return sampleJob.count
        } else {
            return localJob.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.SampleJobCollectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "sampleJobCell", for: indexPath) as! SampleJobCell
            
            cellA.sampleJob = sampleJob[indexPath.row]
            
            return cellA
        } else if collectionView == self.LocalJobCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "localJob", for: indexPath) as! LocalJobCell
            cell.localJob = localJob[indexPath.row]
            return cell
        } else {
            let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: "sampleJobCell", for: indexPath) as! SampleJobCell
            cellC.sampleJob = sampleJob[indexPath.row]
            return cellC
        }
        
        
    }
}
