//
//  SignUpVC.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/28/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var profileImage: CircleImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func uploadProfileBtnWasPressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.image = image
        } else {
            print("did not work uploading image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
