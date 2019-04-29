//
//  CreateNewHireVC.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/15/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit
import Firebase

class CreateNewHireVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var newJobUploadedImage: UIImageView!
    @IBOutlet weak var titleJobNameTxt: UITextField!
    @IBOutlet weak var payInput: UITextField!
    @IBOutlet weak var jobDescriptionText: UITextView!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var uploadPostBtn: RoundedButton!
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        jobDescriptionText.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadPostBtn.bindToKeyboard()
        HideKeyboard()
        titleJobNameTxt.delegate = self
        payInput.delegate = self
        jobDescriptionText.delegate = self
        dateInput.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
 
    func HideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func DismissKeyboard() {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
        view.frame.origin.y = -200
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        view.frame.origin.y = 0
    }
    
    @IBAction func uploadImageBtnWasPressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func uploadJobImage(_ image: UIImage, completion: @escaping(_ url: URL?) -> ()) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user\(uid)")
        
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        storageRef.putData(imageData, metadata: metadata) { metadata, error in
            if error == nil, metadata != nil {
                
                storageRef.downloadURL { url, error in
                    completion(url)
                    // success!
                }
                print("success line 49")
            } else {
                print("failed: line 51")
                completion(nil)
            }
        }
    }
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newJobUploadedImage.image = image
        } else {
            print("did not work uploading image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func uploadJob(withTitle title: String, forUID uid: String, withGroupKey groupKey: String?, forPay pay: String, forDesc description: String, forDate date: String, uploadComplete: @escaping(_ status: Bool) -> ()) {
        if groupKey != nil {
            
        } else {
            
            DataService.instance.REF_JOB_FEED.childByAutoId().updateChildValues(["jobTitle": title, "senderId": uid, "pay": pay, "description": description, "date": date])
            uploadComplete(true)
        }
    }
 
    @IBAction func postJobBtnWasPressed(_ sender: Any) {
        if newJobUploadedImage.image != nil && titleJobNameTxt.text != nil && payInput.text != nil && jobDescriptionText.text != nil && dateInput.text != nil {
            uploadPostBtn.isEnabled = false
            
            
            self.uploadJob(withTitle: self.titleJobNameTxt.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, forPay: self.payInput.text!, forDesc: self.jobDescriptionText.text!, forDate: self.dateInput.text!) { (isComplete) in
                if isComplete {
                    
                    self.uploadPostBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                    
                } else {
                    self.uploadPostBtn.isEnabled = true
                    print("//      there was a problem uploading this job   //")
                }
            }
        }
    }
}


