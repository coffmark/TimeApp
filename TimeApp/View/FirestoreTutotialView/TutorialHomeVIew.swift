//
//  TutorialHomeVIew.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/23.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import FirebaseFirestore



struct TutorialHomeVIew: View {
    
    @State var name: String = ""
    @State var rate: String = ""
    var body: some View {
        VStack{
            TextField("Name", text: $name)
            TextField("Rate", text: $rate)
                .keyboardType(.numberPad)
            
            ScrollView{
                Text("This is a scroll view")
            }
            Button(action: {
                let ratingDictionary = [
                    "name": self.name,
                    "rate": self.rate
                ]
                
                let docRef = Firestore.firestore().document("rate/\(UUID().uuidString)")
                print("setting data")
                docRef.setData(ratingDictionary){(error) in
                    if let error = error{
                        print("error = \(error)")
                    }else {
                        print("data uploaded successfully")
                    }
                    self.name = ""
                    self.rate = ""
                }
            }){
                Text("Add Button")
            }
        }
    }
}

struct TutorialHomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        TutorialHomeVIew()
    }
}
