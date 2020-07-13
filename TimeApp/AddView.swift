//
//  AddView.swift
//  GetupApp
//
//  Created by 神村亮佑 on 2020/07/05.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    
    @Binding var isPresented: Bool
    @State var addTimeVM = AddTimeViewModel()
    @State private var isShowHomeView: Bool = false
    
    
    var inputform: some View{
        ZStack{
            
            Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                HStack{
                    Text("気分は？")
                    TextField("Enter name", text: self.$addTimeVM.name)
                    
                }.padding([.leading], 10)
                
                VStack {
                    
                    HStack {
                        Text("Sleep Time")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding()
                        Image("sleep")
                            .resizable()
                            .frame(width: 100, height: 100)
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
                        Image("rise")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    
                    DatePicker("", selection: self.$addTimeVM.uptime)
                    .labelsHidden()
                        .frame(width: 300, height: 80, alignment: .center)
                    .clipped()
                        .padding(.vertical)
                    
                }
                
                
                
                if isShowHomeView{
                    //TODO: HomeViewに変えて！！！！！
                    ListView()
                }else{
                    Button(action: {
                        self.addTimeVM.saveTime()
                        self.isPresented = false
                        withAnimation(){
                            self.isShowHomeView.toggle()
                        }
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
        AddView(isPresented: .constant(false))
        
    }
}
