//
//  NSManagedObjectContext+Extensions.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/11.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext{
    
    static var current: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
