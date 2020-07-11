//
//  AddOrderView.swift
//  HotCoffeeApp
//
//  Created by 神村亮佑 on 2020/07/11.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    
    
    @Binding var isPresented : Bool
    //@State var addOrderVM = AddOrderViewModel()
    @State var addTimeVM = AddTimeViewModel()
    
    var body: some View {
        
        NavigationView{
            
            Group{
                VStack{
                    TextField("Enter name", text: self.$addTimeVM.name)
                
                    
                    Button("Place Order"){
                        self.addTimeVM.saveTime()
                        self.isPresented = false
                    }.padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
            }.padding()
            
            .navigationBarTitle("Add Order")
        }
    }
}



struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
