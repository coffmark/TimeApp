//
//  HomeView.swift
//  GetupApp
//
//  Created by 神村亮佑 on 2020/07/05.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import BottomBar_SwiftUI


struct HomeView: View {
    
    @State private var pickerSelectedItem: Int = 1
    @State private var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 100, 40, 10, 20],
        [150, 100, 50, 10 ,200, 140, 10],
        [10, 20, 30, 100, 30, 150, 10]
    ]
    
    @State private var dayofweeks: [String] = [
        "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
    ]
    
    
    var body: some View {
        ZStack{
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            VStack{
                Text("Calory Intake")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                
                
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Last Week").tag(0)
                    Text("This Week").tag(1)
                    Text("Fealings").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                HStack(spacing: 16){
                    
                    BarView(value: dataPoints[pickerSelectedItem][0], day_of_week: dayofweeks[0])
                    BarView(value: dataPoints[pickerSelectedItem][1], day_of_week: dayofweeks[1])
                    BarView(value: dataPoints[pickerSelectedItem][2], day_of_week: dayofweeks[2])
                    BarView(value: dataPoints[pickerSelectedItem][3], day_of_week: dayofweeks[3])
                    BarView(value: dataPoints[pickerSelectedItem][4], day_of_week: dayofweeks[4])
                    BarView(value: dataPoints[pickerSelectedItem][5], day_of_week: dayofweeks[5])
                    BarView(value: dataPoints[pickerSelectedItem][6], day_of_week: dayofweeks[6])
                    
                    
                    
                }.padding(.top, 24)
                    .animation(.default)
                
                
            }
            
        }.cornerRadius(100)
        
        
    }
}


struct BarView: View {
    
    var value: CGFloat
    var day_of_week: String
    
    
    var body: some View{
        VStack{
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
                
                
            }
            Text(day_of_week).padding(.top, 8)
            
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
