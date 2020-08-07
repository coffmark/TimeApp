//
//  BarView.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/12.
//  Copyright © 2020 神村亮佑. All rights reserved.
//


import SwiftUI




struct BarView: View {
    
    
    
    var t: CGFloat
    
    let sleepAvrg: CGFloat = 8
    let barWidthAvrg: CGFloat = 150
    
    
    var body: some View {
        
        
        HStack{
            
            
            ZStack (alignment: .leading){
                Capsule()
                    
                    .frame(width: 250, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Capsule()
                    .frame(width: barScore(val: t), height: 30)
                    .foregroundColor(Color.orange)
            }
        }
    }
    
    
    func barScore(val: CGFloat) -> CGFloat {
        
        return val * barWidthAvrg / sleepAvrg
        
    }
    
    
    
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(t: 4)
    }
}


