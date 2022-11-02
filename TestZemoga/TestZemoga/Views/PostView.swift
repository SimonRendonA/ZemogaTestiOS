

import SwiftUI

struct PostView: View {
    var post: Post
    @State var postsViewModel: PostViewModel
    @State var star = "star"
    @State var isFav = false
    @StateObject var network : Network
    var body: some View {
        NavigationLink(destination: PostDetailView( postsViewModel: $postsViewModel, network: network, post: post)){
            HStack{
                
                Text(post.title).fontWeight(.bold)
                Spacer()
                
            }.foregroundColor(.newBlack)
        }.foregroundColor(.newPrimaryColor).onAppear{checkFav()}
    }
    
    func checkFav(){
        isFav = postsViewModel.favorites.contains { element in
            if case post = element {
                self.star="star.fill"
                return true
            } else {
                return false
            }
        }
    }
    
   
}


