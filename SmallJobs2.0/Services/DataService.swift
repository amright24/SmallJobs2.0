//
//  DataService.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/12/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import Foundation
import Firebase


let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_MESSAGE_FEED = DB_BASE.child("messageFeed")
    private var _REF_JOB_FEED = DB_BASE.child("jobFeed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_JOB_FEED: DatabaseReference {
        return _REF_JOB_FEED
    }
    
    var REF_MESSAGE_FEED: DatabaseReference {
        return _REF_MESSAGE_FEED
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadMessage(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping(_ status: Bool) ->()) {
        if groupKey != nil {
            // send to groups ref
        } else {
            REF_MESSAGE_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    
    func uploadJob(withImage image: UIImage, forUID uid: String, withGroupKey groupKey: String?, forPay pay: String, forDesc description: String, forDate date: String, uploadComplete: @escaping(_ status: Bool) -> ()) {
        if groupKey != nil {
            
        } else {
        REF_JOB_FEED.childByAutoId().updateChildValues(["jobImage": image, "senderId": uid, "pay": pay, "description": description, "date": date])
        uploadComplete(true)
        }
    }
    
}
