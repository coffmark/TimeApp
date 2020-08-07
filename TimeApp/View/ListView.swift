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
    
    
    
    
    var list: some View{
        
        NavigationView{
            
            
            List{
                ForEach(self.timeListVM.times, id: \.name){ time in
                    CardView(name: time.name, sleepTime: time.downtime, getupTime: time.uptime)
                }.onDelete(perform: delete)
                    .listRowBackground(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
                        .clipped()
                        .cornerRadius(10)
                        .padding([.vertical], 5))
                
            }
            .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                
                
                .sheet(isPresented: $isPresented, onDismiss: {
                    print("ONDISMISS")
                    self.timeListVM.fetchAllTimes()
                }, content: {
                    AdditionalView(isPresented: self.$isPresented)
                })
                
                
                
                
                .navigationBarItems(
//                    leading: NavigationLink(destination: AuthenticationView()){
//                    Image(systemName: "person.crop.circle")
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(Color.orange)
//                    },
                    
                    trailing: Button(action: {
                        self.isPresented = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.orange)
                    }))
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    var body: some View{
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            list
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
