//
//  AddView.swift
//  GetupApp
//
//  Created by 神村亮佑 on 2020/07/05.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import FirebaseFirestore




struct OneDay: Identifiable{
    var id = UUID()
    var name: String
}





struct AdditionalView: View {
    
    
    //Sheetを表示するかどうか
    @Binding var isPresented: Bool
    
    //ViewModelの呼び出し
    @State var addTimeVM = AddTimeViewModel()
    
    //OneDaysのディクショナリー
//    @State var OneDays: [OneDay]
    
    
    

    
    
    var inputform: some View{
        ZStack{
            
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Text("memo")
                        .foregroundColor(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                        .font(.callout)
                        .fontWeight(.bold)
                    TextField("Enter name", text: self.$addTimeVM.name)
                    
                }.padding([.leading], 100)
        
                VStack {
                    HStack {
                        Text("Sleep Time")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                        Image("sleep")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    DatePicker("", selection: self.$addTimeVM.downtime)
                        .labelsHidden()
                    .foregroundColor(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                        .frame(width: 300, height: 80, alignment: .center)
                        .clipped()
                        .padding(.vertical)
                }
                VStack {
                    HStack {
                        Text("Get up Time")
                            .font(.callout)
                            .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                            .padding()
                        
                        Image("rise")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    DatePicker("", selection: self.$addTimeVM.uptime)
                        .labelsHidden()
                        .frame(width: 300, height: 80, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                        .clipped()
                        .padding(.vertical)
                }
                Button(action: {
                    self.addTimeVM.saveTime()
                    self.isPresented = false
                    
                    
                    
//                    let recodedOneDay = [
//                        "name": self.$addTimeVM.name,
//                    ] as [String : Any]
//                    //MARK: - as [String : Any]とは？？
//
//                    let docRef = Firestore.firestore().document("oneday/\(UUID().uuidString)")
//                    print("Setting OneDay Data")
//
//
//
//
//                    docRef.setData(recodedOneDay){(error) in
//                        if let error = error{
//                            print("error = \(error)")
//                        }else{
//                            print("data uploaded successfully")
//                        }
//                    }
                }) {
                    Text("入力")
                        .font(.title)
                        .fontWeight(.light)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.2940887213, green: 0.2941361666, blue: 0.2940783501, alpha: 1)))
                        .cornerRadius(30)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .padding(10)
                }}
//     .onAppear(){
//                Firestore.firestore().collection("onedays").addSnapshotListener{ querySnapshot, error in
//                    guard let documents = querySnapshot?.documents else{
//                        print("Error fetching documents: \(error!)")
//                        return
//                    }
//
//
//                    let names = documents.map{ $0["name"]! }
//
//                    print(names)
//
//                    self.OneDays.removeAll()
//
//
//                    for i in 0..<names.count{
//                        self.OneDays.append(OneDay(
//                            name: names[i] as? String ?? "Failed to get name"
//                            )
//                        )
//                    }
//
//                }
//            }
        }.cornerRadius(100)
    }
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
            inputform
        }
    }
}


struct AdditionalView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalView(isPresented: .constant(false))
        
    }
}
