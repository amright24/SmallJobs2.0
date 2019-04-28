//
//  Message.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/25/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
