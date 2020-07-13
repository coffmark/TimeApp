//
//  CardView.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/13.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        HStack{
            Text("😁")
                .font(.largeTitle)
                .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                .cornerRadius(30)
                .padding([.leading], 10)
            
            VStack (alignment: .leading){
                Text("7/13")

          
                    
                BarView(value: 8.5)
              
                
                
                
                Text("一言")
                    .padding()
                
            }.padding([.leading], 50)
            
        }
        
        
        
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().previewLayout(.sizeThatFits)
    }
}
