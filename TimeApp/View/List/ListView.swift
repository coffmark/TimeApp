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
                    CardView(name: time.name, sleepTime: time.downtime, getupTime: time.uptime)
                }.onDelete(perform: delete)
                    .listRowBackground(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
                        .clipped()
                        .cornerRadius(10)
                        .padding([.vertical], 5))
                
            }.background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                
                
                .sheet(isPresented: $isPresented, onDismiss: {
                    print("ONDISMISS")
                    self.timeListVM.fetchAllTimes()
                }, content: {
                    AdditionalView(isPresented: self.$isPresented)
                })
                
                
                
                
                .navigationBarItems(
                    leading: NavigationLink(destination: AuthenticationView()){
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    },
                    
                    trailing: Button(action: {
                        self.isPresented = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    }))
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
