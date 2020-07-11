//
//  AddView.swift
//  GetupApp
//
//  Created by 神村亮佑 on 2020/07/05.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    let endTime = Calendar.current.date(byAdding: .hour,value: 24,  to: Date())!
    
    var timeFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    
    
    @State private var gotobedTime = Date()
    @State private var getupTime = Date()
    
    
    //消す
    @State private var textboxname : String = ""


    
    
    var inputform: some View{
        ZStack{
            
            Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1))
                .edgesIgnoringSafeArea(.all)

            
            VStack{
                
                HStack{
                    Text("名前は？")
                    TextField("Enter name", text: self.$textboxname)
                    
                }.padding([.leading], 50)
                
                HStack {
                    
                    VStack {
                        Text("Sleep Time")
                            .font(.callout)
                            .fontWeight(.bold)
                            
                        Image("sleep")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                    }.padding()
                    
                    DatePicker("", selection: $gotobedTime,in: Date()...endTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .frame(width: 150, height: 80, alignment: .center)
                        .clipped()
                        .padding(.vertical)
                }.padding()
                HStack {
                    
                    VStack {
                        Text("Get up Time")
                        .font(.callout)
                        .fontWeight(.bold)
                        Image("rise")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }.padding()
                        

                    
                    
                    DatePicker("", selection: $getupTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .frame(width: 150, height: 80, alignment: .center)
                        .clipped()
                        .padding(.vertical)
                    
                    
                }
                
                
                
                
                
                Button(action: {
                    print(self.getupTime)
                    
                    
                }) {
                    Text("Input")
                        .font(.title)
                        .fontWeight(.light)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                        .cornerRadius(30)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)), lineWidth: 5)
                    )
                }
            }
        }.cornerRadius(100)
    }
    
    
    var body: some View {
        
        ZStack{
            inputform
        }
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView().environment(\.locale, Locale(identifier: "ja_JP"))
        
    }
}
