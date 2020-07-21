//
//  User.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/21.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation

class User{
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?){
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
