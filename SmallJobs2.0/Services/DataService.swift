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
let SB_BASE = Storage.storage().reference()

class DataService {
    static let instance = DataService()
    
    let uid = Auth.auth().currentUser?.uid
    
    private var _REF_STORAGE = SB_BASE
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_MESSAGE_FEED = DB_BASE.child("messageFeed")
    private var _REF_JOB_FEED = DB_BASE.child("jobFeed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_STORAGE: StorageReference {
        return _REF_STORAGE
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
    
    func getUsername(forUID uid: String, handler: @escaping(_ username: String) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func uploadMessage(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping(_ status: Bool) ->()) {
        if groupKey != nil {
            // send to groups ref
        } else {
            REF_MESSAGE_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    
    func getAllFeedJobs(handler: @escaping (_ jobs: [Job]) -> ()) {
        var jobArray = [Job]()
        REF_JOB_FEED.observeSingleEvent(of: .value) { (feedJobSnapshot) in
            guard let feedJobSnapshot = feedJobSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for job in feedJobSnapshot {
                let title = job.childSnapshot(forPath: "jobTitle").value as! String
                let pay = job.childSnapshot(forPath: "pay").value as! String
                let description = job.childSnapshot(forPath: "description").value as! String
                let date = job.childSnapshot(forPath: "date").value as! String
                let senderId = job.childSnapshot(forPath: "senderId").value as! String
                let job = Job(title: title, pay: pay, description: description, date: date, senderId: senderId)
                jobArray.append(job)
            }
            handler(jobArray)
        }
        
       // ACCESS STORAGE HERE AND DO "FOR" LOOP TO GET JOB IMAGES
        
        
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        REF_MESSAGE_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            
            handler(messageArray)
            
        }
    }
    
    
    
}
