//
//  BarView.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/12.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct BarView: View {
    
    var value: CGFloat
    
    let sleepAvrg: CGFloat = 8
    let barWidthAvrg: CGFloat = 150
    
    
    
    
    
    var body: some View {
        
        
        HStack{
            Text("9h")
                .padding([.leading], -25)
            
            ZStack (alignment: .leading){
                Capsule().frame(width: 225, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Capsule().frame(width: barScore(val: value), height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
            }
        }
    }
    
    
    func barScore(val: CGFloat) -> CGFloat {
        return val * barWidthAvrg / sleepAvrg
    }
    
    
    
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: 8)
    }
}
