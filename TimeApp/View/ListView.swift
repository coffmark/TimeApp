//
//  ContentView.swift
//  HotCoffeeApp
//
//  Created by 神村亮佑 on 2020/07/11.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var timeListVM: TimeListViewModel
    @State private var isPresented: Bool = false
    
    init() {
        self.timeListVM = TimeListViewModel()
    }
    
    private func delete(at offsets: IndexSet){
        offsets.forEach{ index in
            let timeVM = self.timeListVM.times[index]
            self.timeListVM.deleteTime(timeVM)
        }
    }
    
    
    
    var body: some View{
        NavigationView{
            List{
                ForEach(self.timeListVM.times, id: \.name){ time in
                    HStack{
                        Text(time.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                    }
                }.onDelete(perform: delete)
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                print("ONDISMISS")
                self.timeListVM.fetchAllTimes()
            }, content: {
                AddOrderView(isPresented: self.$isPresented)
            })
                
                .navigationBarTitle("Orders")
                .navigationBarItems(trailing: Button("Add New Order"){
                    self.isPresented = true
                })
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}