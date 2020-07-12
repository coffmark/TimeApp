//
//  CoreDataManager.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/11.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation
import CoreData


class CoreDataManager{
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext){
        self.moc = moc
    }
    
    private func fetchTime(name: String) -> Time? {
        var times = [Time]()
        
        let request: NSFetchRequest<Time> = Time.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        
        do{
            times = try self.moc.fetch(request)
        }catch let error as NSError{
            print(error)
        }
        
        return times.first
    }
    
    func deleteTime(name: String) {
        do {
            if let time = fetchTime(name: name){
                self.moc.delete(time)
                try self.moc.save()
            }
        }catch let error as NSError{
            print(error)
        }
    }
    
    
    func getAllTimes() -> [Time] {
        var times = [Time]()
        let timeRequest: NSFetchRequest<Time> = Time.fetchRequest()
        
        do{
            times = try self.moc.fetch(timeRequest)
        }catch let error as NSError{
            print(error)
        }
        return times
    }
    
    func saveTime(name: String, downtime: Date, uptime: Date){
        let time = Time(context: self.moc)
        time.name = name
        time.downtime = downtime
        time.uptime = uptime
        
        do{
            try self.moc.save()
        }catch let error as NSError{
            print(error)
        }
    }
}
