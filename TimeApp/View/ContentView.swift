


import SwiftUI
import BottomBar_SwiftUI




let items: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", title: "Home", color: Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1))),
    BottomBarItem(icon: "person.2", title: "Connect", color: Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1))),
    BottomBarItem(icon: "square.and.arrow.up", title: "Share", color: Color(#colorLiteral(red: 0.6229396462, green: 0.5232685804, blue: 0.9278500676, alpha: 1)))
]

struct BasicView: View {
    let item: BottomBarItem
    
//    var detailText: String {
//        "\(item.title) Detail"
//    }
//
//
//    var destination: some View {
//        Text(detailText)
//            .navigationBarTitle(Text(detailText))
//    }
//
//    var navigateButton: some View {
//        NavigationLink(destination: destination) {
//            ZStack {
//                Rectangle()
//                    .fill(item.color)
//                    .cornerRadius(8)
//                    .frame(height: 52)
//                    .padding(.horizontal)
//
//                Text("Navigate")
//                    .font(.headline)
//                    .foregroundColor(.white)
//            }
//        }
//    }
    
    
    
    var body: some View {
        VStack {
            Spacer()
            
            
            if item.title == "Home"{
                ListView()
                    .animation(.easeInOut(duration: 100))
            }else if item.title == "Connect"{
                FriendsView()
                    .animation(.easeInOut(duration: 100))
            }else{
                ShareView()
                    .animation(.easeInOut(duration: 100))
            }
            
            
            Spacer()
//
//            navigateButton
        }
    }
}

struct ContentView : View {
    @State private var selectedIndex: Int = 0
    
    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                BasicView(item: selectedItem)
                    .navigationBarTitle(Text(selectedItem.title))
                BottomBar(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
