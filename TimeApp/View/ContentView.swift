import SwiftUI


struct ContentView : View {
    
    var body: some View {
        TutorialHomeVIew(reviewedRestaurants: [])
        
        //MARK: - 本来ならば、ContentView()とかく
        //ContentView()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
