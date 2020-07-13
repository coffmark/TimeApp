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
                        Text("😁")
                            .font(.largeTitle)
                            .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                            .cornerRadius(30)
                        
                        
                        Text(time.name)
                            .font(.title)
                            .padding([.leading], 10)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                        
                        
                        HStack {
                            Spacer()
                            Text(String(format: "%.1f", time.uptime.timeIntervalSince(time.downtime) / 3600))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            Text("h")
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            Spacer()
                            
                        }.padding()
                        
                        
                    }
                }.onDelete(perform: delete)
                    .listRowBackground(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
                        .clipped()
                        .cornerRadius(10)
                        .padding([.vertical], 5))
                
            }.background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                
                
                .sheet(isPresented: $isPresented, onDismiss: {
                    print("ONDISMISS")
                    self.timeListVM.fetchAllTimes()
                }, content: {
                    AddOrderView(isPresented: self.$isPresented)
                })
                
                .navigationBarItems(trailing: Button(action: {
                    self.isPresented = true
                }, label: {
                    Image(systemName: "plus.circle")
                        
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                }))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
