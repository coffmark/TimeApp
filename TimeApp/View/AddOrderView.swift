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
                    ZStack{
                        
                        Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1))
                            .edgesIgnoringSafeArea(.all)
                        
                        
                        VStack{
                            Spacer()
                            HStack{
                                Text("気分は？")
                                TextField("Enter name", text: self.$addTimeVM.name)
                                
                            }.padding([.leading], 100)
                                .padding([.vertical], 10)
                            
                            VStack {
                                
                                HStack {
                                    Text("Sleep Time")
                                        .font(.callout)
                                        .fontWeight(.bold)
                                        .padding()
                                    Image(systemName: "moon.zzz.fill")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .padding()
                                }
                                
                                DatePicker("", selection: self.$addTimeVM.downtime)
                                    .labelsHidden()
                                    .frame(width: 300, height: 80, alignment: .center)
                                    .clipped()
                                    .padding(.vertical)
                                
                            }
                            VStack {
                                
                                HStack {
                                    Text("Get up Time")
                                        .font(.callout)
                                        .fontWeight(.bold)
                                        .padding()
                                    Image(systemName: "sunrise.fill")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .padding()
                                }
                                
                                DatePicker("", selection: self.$addTimeVM.uptime)
                                    .labelsHidden()
                                    .frame(width: 300, height: 80, alignment: .center)
                                    .clipped()
                                    .padding(.vertical)
                                
                            }
                            
                            
                            Button(action: {
                                self.addTimeVM.saveTime()
                                self.isPresented = false
                                
                            }) {
                                Text("Input")
                                    .font(.title)
                                    .fontWeight(.light)
                                    .padding()
                                    .background(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                                    .cornerRadius(30)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .padding(10)
                                    
                            }
                            Spacer()
                            
                            
                            
                            
                        }
                    }.cornerRadius(100)
                    
                }.padding()
                
                
            }
        }
    }
}


struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
