//
//  NewMessageToBoss.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/15/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit
import Firebase

class NewMessageToBoss: UIViewController {
    
    @IBOutlet weak var profileImage: CircleImage!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        sendBtn.bindToKeyboard()
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textField.text != nil && textField.text != "Say something about the job..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textField.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                if isComplete {
                self.sendBtn.isEnabled = true
                self.dismiss(animated: true, completion: nil)
            } else {
                self.sendBtn.isEnabled = true
                print("there was an error")
            }
        }
    }
}
    

    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension NewMessageToBoss: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
