//
//  TutorialHomeVIew.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/23.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import FirebaseFirestore


struct Restaurant: Identifiable{
    var id = UUID()
    var name: String
    var rating: String
}




struct TutorialHomeVIew: View {
    
    @State private var name: String = ""
    @State private var rate: String = ""
    
    @State var reviewedRestaurants:[Restaurant]
    
    
    var body: some View {
        VStack{
            TextField("Name", text: $name)
            TextField("Rate", text: $rate)
                .keyboardType(.numberPad)
            
            ScrollView{
                if reviewedRestaurants.count > 0{
                    ForEach(reviewedRestaurants, id: \.id){ thisRestrant in
                        Text("\(thisRestrant.name) || \(thisRestrant.rating)")
                        
                    }
                }else {
                    Text("Submit a reviews")
                }
            }.frame(width: UIScreen.main.bounds.size.width)
                .background(Color.red)
            
            
            
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
        }.onAppear(){
            Firestore.firestore().collection("ratings").addSnapshotListener{ querySnapshot, error in
                guard let documents = querySnapshot?.documents else{
                    print("Error fetching documnets: \(error!)")
                    return
                }
                
                
                let names = documents.map{ $0["name"]! }
                let ratings = documents.map{ $0["rating"]! }
                
                print(names)
                print(ratings)
                
                self.reviewedRestaurants.removeAll()
                
                for i in 0..<names.count{
                    self.reviewedRestaurants.append(Restaurant(name: names[i] as? String ?? "Failed to get name", rating: ratings[i] as? String ?? "Failed to get rating"))
                }
            }
        }
    }
}

struct TutorialHomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        TutorialHomeVIew(reviewedRestaurants: [])
    }
}
