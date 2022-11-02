import Foundation
import SwiftUI
struct ContentView: View {
    @State var postsViewModel: PostViewModel = PostViewModel()
    @StateObject var network = Network()
    var body: some View {
        GeometryReader{ metrics in
            NavigationView{
                VStack{
                    HeaderView().frame(width:metrics.size.width, height: metrics.size.height*0.05).padding(.bottom)
                    ButtonsView( postsViewModel: $postsViewModel).frame(width:metrics.size.width, height: metrics.size.height*0.12).padding(.bottom)
                    PostsView(postsViewModel: postsViewModel, network: network)
                    
                    
                }
            }
        }.onAppear{
            postsViewModel.loadUserDefaults()
        }
       
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

