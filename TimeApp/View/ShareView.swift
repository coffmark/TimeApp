//
//  ShareView.swift
//  GetupApp
//
//  Created by 神村亮佑 on 2020/07/05.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct ShareView: View {
    

    
    
    var body: some View {
        ZStack{
            
            Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    //TODO: Action
                }) {
                    
                    HStack {
                        Image("twitter")
                            .resizable()
                            .frame(width: 50, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                        
                        Text("Twitter")
                    
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                      
                        
                    }.padding()
                    
                }.background(Color.white)
                    .cornerRadius(40)
                
                
                
                Button(action: {
                    //TODO: Action
                }) {
                    
                    
                    HStack {
                        Image("facebook")
                            .resizable()
                            .frame(width: 50, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                        
                        Text("facebook")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                        
                    }.padding()
                    
                }.background(Color.white)
                .cornerRadius(40)
                
                Button(action: {
                    //TODO: Action
                }) {
                    HStack {
                        Image("instagram")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                        
                        Text("instagram")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                        
                    }.padding()
                    
                }.background(Color.white)
                .cornerRadius(40)
            }
            
            
        }.cornerRadius(100)
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
