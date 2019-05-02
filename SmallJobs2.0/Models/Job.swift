//
//  Job.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/29/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import Foundation

class Job {
    private var _title: String
    private var _pay: String
    private var _description: String
    private var _date: String
    private var _senderId: String
    
    var title: String {
        return _title
    }
    
    var pay: String {
        return _pay
    }
    
    var description: String {
        return _description
    }
    
    var date: String {
        return _date
    }
    
    var senderId: String {
        return _senderId
    }
    
    
    init(title: String, pay: String, description: String, date: String, senderId: String) {
        self._title = title
        self._pay = pay
        self._description = description
        self._date = date
        self._senderId = senderId
    }
}
