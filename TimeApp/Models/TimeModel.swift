//
//  TimeModel.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/27.
//  Copyright © 2020 神村亮佑. All rights reserved.
//
import Foundation
import SwiftUI
import CoreData
import Combine


class TimeModel{
    var name: String = ""
    var downtime: Date
    var uptime: Date

    init(time: Time) {
        self.name = time.name!
        self.downtime = time.downtime!
        self.uptime = time.uptime!
    }
}
