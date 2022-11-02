

import SwiftUI

struct PostsView: View {
    
    @StateObject var postsViewModel: PostViewModel
    @StateObject var network : Network
    

    var body: some View {
        
        ZStack{
            Color.newWhite
            VStack{
                if postsViewModel.favorites.count > 0 {
                    Text("Favorites").foregroundColor(.newPrimaryColor).font(.title2)
                    List(postsViewModel.favorites){ post in
                        HStack{
                            PostView(post: post, postsViewModel: postsViewModel, network: network)
                            Image(systemName: "star.fill").foregroundColor(.newPrimaryColor)
                        }
                        

                      
                    }
                                }
                
                
                List(postsViewModel.posts){ post in
                    let isFav = postsViewModel.favorites.contains { element in
                        if case post = element {
                            return true
                        } else {
                            return false
                        }
                    }
                    if isFav == false{
                        PostView(post: post, postsViewModel: postsViewModel, network: network)
                    }
                    
                  
                }
            }
            
            
        }
       
        
    }
}

