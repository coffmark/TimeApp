//
//  SignInView.swift
//  TimeApp
//
//  Created by 神村亮佑 on 2020/07/22.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @State var email : String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject private var session: SessionStore
    
    func signIn(){
        loading = true
        error = false
        session.signIn(email: email, password: password){
            (result, error) in self.loading = false
            if error != nil{
                self.error = true
            }else{
                self.email = ""
                self.password = ""
            }
        }
    }
    var body: some View {
        VStack{
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            if(error){
                Text("ahhh crap")
            }
            Button(action: signIn){
                Text("Sign In")
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
