//
//  AfterLogInView.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/22.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import Firebase

struct AfterLogInView: View {
    var body: some View{
        
        NavigationView{
            VStack{
                
                Text("Logged successfully")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(0.7))
                
                
                NavigationLink(destination: TutorialHomeVIew(reviewedRestaurants: [])){
                    Text("Go to the next page.")
                }
                
                
            }
            .navigationBarTitle("")
            .navigationBarItems(leading: Button(action: {
                
                //MARK: - write Add Group Logic
                
            }) {
                
                Image(systemName: "person.3.fill")
                    
                    .resizable()
                    .frame(width: 40, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                
            }.cornerRadius(10)
            .padding(.top, 25),
            
            trailing:  Button(action: {
            
            try! Auth.auth().signOut()
            UserDefaults.standard.set(false, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            
            }) {
                
                Image(systemName: "person.crop.circle.badge.xmark")
                    
                    .resizable()
                    .frame(width: 40, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                
                }
            .cornerRadius(10)
            .padding(.top, 25))
            
        }
        
        
        
        
    }
}

struct AfterLogInView_Previews: PreviewProvider {
    static var previews: some View {
        AfterLogInView()
    }
}
