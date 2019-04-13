//
//  JobChannelCell.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/12/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class JobChannelCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var jobChannelIcon: UIImageView!
    
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
    
    
    let imageNames = ["home.png", "saved.png", "hires.png", "history.png"]
        var image: UIImage!
        let imageView: UIImageView = {
        
        
            
        let iv = UIImageView()
        iv.image = UIImage(named: "home.png")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.init(red: 235, green: 235, blue: 235, alpha: 1)
        return iv
    }()
    
    
//        var jobChannel: JobChannel! {
//            didSet {
//                updateUI()
//            }
//        }
    
    
    
        
//        private func updateUI() {
//            jobChannelIcon?.image! = jobChannel.image
//        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "jobChannelCell", for: indexPath) as! JobChannelCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item]) 
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGSize = CGSize(width: frame.width / 4, height: frame.height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 10
    }
    
    
}

