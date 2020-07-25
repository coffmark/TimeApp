//
//  AddView.swift
//  GetupApp
//
//  Created by 神村亮佑 on 2020/07/05.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct AdditionalView: View {
    
    @State private var stampList: [String] = ["😁", "😱"]
    
    @Binding var isPresented: Bool
    @State var addTimeVM = AddTimeViewModel()
    @State private var isShowHomeView: Bool = false
    
    
    var inputform: some View{
        ZStack{
            
            Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                
                
//                HStack {
//                    Text("Feelings")
//                        .padding([.trailing], 20)
//                    HStack{
//
//                        ForEach(self.stampList, id: \.self){ stamp in
//
//                            Button(action: {
//
//
//                            }) {
//                                Text(stamp)
//                                    .font(.title)
//                                    .padding()
//                                    .background(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
//                                .cornerRadius(50)
//
//                            }
//                        }
//                    }
//                }
                
                HStack{
                    Text("memo")
                    .foregroundColor(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                        .font(.callout)
                        .fontWeight(.bold)
                    TextField("Enter name", text: self.$addTimeVM.name)
                    
                }.padding([.leading], 100)
                
                
                
                
                
                
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
                        Text("入力")
                            .font(.title)
                            .fontWeight(.light)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                            .cornerRadius(30)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .padding(10)
                            
                    }
                    
                }
                
                
            }
        }.cornerRadius(100)
    }
    
    
    var body: some View {
        
        ZStack{
            Color(#colorLiteral(red: 0.7392455935, green: 0.7496188283, blue: 0.7361342311, alpha: 1)).edgesIgnoringSafeArea(.all)
            inputform
        }
    }
}


struct AdditionalView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalView(isPresented: .constant(false))
        
    }
}
