//
//  LoginVC.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/12/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // O U T L E T S
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    // O U T L E T S
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        HideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        // Do any additional setup after loading the view.
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
        view.frame.origin.y = -50
    }
    @objc func keyboardWillChange(notification: Notification) {
    }
    @objc func keyboardWillHide(notification: Notification) {
        view.frame.origin.y = 0
    }
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("logged in SUCCESS!")
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                })
            }
        }
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension LoginVC: UITextFieldDelegate {
    
}
