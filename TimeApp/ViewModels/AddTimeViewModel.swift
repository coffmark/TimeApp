//
//  AddTimeViewMOdel.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/11.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation
import SwiftUI

class AddTimeViewModel{
    
    var name: String = ""
    var downtime: Date = Date()
    var uptime: Date = Date()
    
    func saveTime() {
        CoreDataManager.shared.saveTime(name: self.name, downtime: self.downtime, uptime: self.uptime)
    }
    
}
