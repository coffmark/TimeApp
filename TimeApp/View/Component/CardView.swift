//
//  CardView.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/13.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

extension DateFormatter {
    // テンプレートの定義(例)
    enum Template: String {
        case date = "Md"     // 2017/1/1
        case time = "Hms"     // 12:39:22
        case full = "yMdkHms" // 2017/1/1 12:39:22
        case onlyHour = "k"   // 17時
        case era = "GG"       // "西暦" (default) or "平成" (本体設定で和暦を指定している場合)
        case weekDay = "EEEE" // 日曜日
    }
    
    func setTemplate(_ template: Template) {
        // optionsは拡張用の引数だが使用されていないため常に0
        dateFormat = DateFormatter.dateFormat(fromTemplate: template.rawValue, options: 0, locale: .current)
    }
}

struct CardView: View {
    
    
    var name: String
    var sleepTime: Date
    var getupTime: Date
    
    //dateformatter
    @Environment(\.timeZone) var timeZone
    
    
    
    var dateFormat: DateFormatter{
        let dformatter = DateFormatter()
        dformatter.setTemplate(.date)
        return dformatter
    }
    
    
    
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            VStack(alignment: .leading){
                
                Text("\(sleepTime, formatter: self.dateFormat)")
                    .font(.title)
                    .fontWeight(.medium)
            }
            
            
            
            HStack{
                Text("\(String(format: "%.1f", getupTime.timeIntervalSince(sleepTime) / 3600))h")
                    .font(.title)
                    .fontWeight(.heavy)
                BarView(t: CGFloat(getupTime.timeIntervalSince(sleepTime) / 3600))
            }
            VStack(alignment: .center){
                Text(name)
            }
            
        }
        
        
        
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(name: "一言", sleepTime: Date(), getupTime: Date(timeIntervalSinceNow: 18000)).previewLayout(.sizeThatFits)
    }
}
