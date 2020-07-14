//
//  CardView.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/13.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    
    var name: String
    var sleepTime: Date
    var getupTime: Date
    
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
    
    
    
    var body: some View {
        HStack{
            Text("😁")
                .font(.largeTitle)
                .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                .cornerRadius(30)
                .padding([.leading], 10)
            
            VStack (alignment: .leading){
                Text("7/13")
                HStack {
                    
                    
                    
                    
                    VStack {
                        Text("\(sleepTime, formatter: self.dateFormat)")
                            .font(.title)
                            .padding([.leading], 10)
                        
                        
                        Text("\(getupTime, formatter: self.dateFormat)")
                            .font(.title)
                            .padding([.leading], 10)
                    }
                    
                }
                
                Text("\(String(format: "%.1f", getupTime.timeIntervalSince(sleepTime) / 3600))h")
                    .padding([.leading], -25)
                
                BarView(t: CGFloat(getupTime.timeIntervalSince(sleepTime) / 3600))
                
                
                Text(name)
        
                
                
            }.padding([.leading], 50)
            
        }
        
        
        
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(name: "一言", sleepTime: Date(), getupTime: Date(timeIntervalSinceNow: 18000)).previewLayout(.sizeThatFits)
    }
}
