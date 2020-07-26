//
//  Task.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/26.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation

enum TaskPriority {
    case high
    case medium
    case low
}

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var priority: TaskPriority
    var completed: Bool
}


#if DEBUG
let testDataTasks = [
    Task(title: "Implement UI", priority: .medium, completed: false),
    Task(title: "Connect to Firebase", priority: .high, completed: false),
    Task(title: "????", priority: .low, completed: false)
]
#endif
