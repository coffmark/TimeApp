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
    
    //dateformatter
    @Environment(\.timeZone) var timeZone
    
    var dateFormat: DateFormatter{
        let dformat = DateFormatter()
        dformat.dateStyle = .medium
        dformat.timeStyle = .medium
        dformat.dateFormat = "HH:mm:ss"
        dformat.timeZone = timeZone
        return dformat
    }
    
    
    
    var body: some View{
        NavigationView{
            List{
                ForEach(self.timeListVM.times, id: \.name){ time in
                    HStack{
                        Text(time.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                        
                        
                        //個別にdowntimeとuptimeを表したいときは使えばいいと思う
                        //                        Text("\(time.downtime, formatter: self.dateFormat)")
                        //                        .font(.caption)
                        //                        .padding([.leading], 10)
                        //
                        //                        Text("\(time.uptime, formatter: self.dateFormat)")
                        //                            .font(.caption)
                        //                        .padding([.leading], 10)
                        
                        HStack {
                            Spacer()
                            Text(String(format: "%.1f", time.uptime.timeIntervalSince(time.downtime) / 3600))
                            Text("h")
                            Spacer()
                            
                        }.padding()
                        
                        
                    }
                }.onDelete(perform: delete)
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                print("ONDISMISS")
                self.timeListVM.fetchAllTimes()
            }, content: {
                AddOrderView(isPresented: self.$isPresented)
            })
                
                .navigationBarItems(trailing: Button("Add"){
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
