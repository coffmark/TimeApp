//
//  OrderListViewModel.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/11.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class TimeListViewModel: ObservableObject{
    
    @Published var times = [TimeViewModel]()
    
    init() {
        fetchAllTimes()
    }
    
    func deleteTime(_ orderVM: TimeViewModel) {
        CoreDataManager.shared.deleteTime(name: orderVM.name)
        fetchAllTimes()
    }
    
    func fetchAllTimes() {
        self.times = CoreDataManager.shared.getAllTimes().map(TimeViewModel.init)
        print(self.times)
    }
}


class TimeViewModel{
    var name :String = ""
    
    init(time: Time) {
        self.name = time.name!
    }
}

