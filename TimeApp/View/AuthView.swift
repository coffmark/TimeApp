
import SwiftUI 


struct AuthView : View {
    
    @EnvironmentObject var session: SessionStore
    
    
    func getUser(){
        session.listen()
    }
    
    
    var body: some View{
        Group{
            if (session.session != nil){
                Text("Hello User")
            }else{
                SignInView()
            }
        }.onAppear(perform: getUser)
    }
}



struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
