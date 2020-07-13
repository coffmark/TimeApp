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
    
    var body: some View {
        VStack{
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
            }
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: 0)
    }
}
