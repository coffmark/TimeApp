//
//  HomeView.swift
//  GetupApp
//
//  Created by 神村亮佑 on 2020/07/05.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI



struct HomeView: View {
    
    @State private var dataPoints: [CGFloat] = [50, 100, 150, 100, 40, 10, 20]
        
    
    @ObservedObject var timeListVM: TimeListViewModel
    @State private var isPresented: Bool = false
    
    init() {
        self.timeListVM = TimeListViewModel()
    }
    
    private func delete(at offsets: IndexSet){
        offsets.forEach{ index in
            let timeVM = self.timeListVM.times[index]
            self.timeListVM.deleteTime(timeVM)
        }
    }
    
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
        NavigationView{
        ZStack{
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            VStack{
                Text("Calory Intake")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                
                
                
                
                
                HStack(spacing: 16){
                    
                    BarView(value: dataPoints[0])
                    BarView(value: dataPoints[1])
                    BarView(value: dataPoints[2])
                    BarView(value: dataPoints[3])
                    BarView(value: dataPoints[4])
                    BarView(value: dataPoints[5])
                    BarView(value: dataPoints[6])
                    
                }.padding(.top, 24)
                    .animation(.default)
            }
        }.cornerRadius(100)
    }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
