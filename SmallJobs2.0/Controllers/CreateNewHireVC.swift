//
//  CreateNewHireVC.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/15/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit
import Firebase

class CreateNewHireVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var newJobUploadedImage: UIImageView!
    @IBOutlet weak var titleJobNameTxt: UITextField!
    @IBOutlet weak var payInput: UITextField!
    @IBOutlet weak var jobDescriptionText: UITextView!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var uploadPostBtn: RoundedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobDescriptionText.delegate = self
        
        //  MIGHT GET RID OF THIS!!!
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        //  MIGHT GET RID OF THIS!!!
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status and drop into background
        view.endEditing(true)
    }
    
    //  MIGHT GET RID OF THIS!!! //  MIGHT GET RID OF THIS!!!//  MIGHT GET RID OF THIS!!!
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateNewHireVC.dismissKeyboard))
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
    
    
    //  MIGHT GET RID OF THIS!!!//  MIGHT GET RID OF THIS!!!//  MIGHT GET RID OF THIS!!!
    
    
    
    
    
    @IBAction func postJobBtnWasPressed(_ sender: Any) {
        if newJobUploadedImage.image != nil && titleJobNameTxt.text != nil && payInput.text != nil && jobDescriptionText.text != nil && dateInput.text != nil {
            uploadPostBtn.isEnabled = false
            DataService.instance.uploadJob(withImage: newJobUploadedImage.image!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, forPay: payInput.text!, forDesc: jobDescriptionText.text, forDate: dateInput.text!) { (isComplete) in
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
    
    
    @IBAction func uploadImageBtnWasPressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //after complete
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newJobUploadedImage.image = image
        } else {
            
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    

}

extension CreateNewHireVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        jobDescriptionText.text = ""
        view.addGestureRecognizer(tap)
    }
    
    
}
