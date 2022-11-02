//
//  ButtonsView.swift
//  TestZemoga
//
//  Created by Developer on 1/11/22.
//

import SwiftUI

struct ButtonsView: View {
    @State var posts = [Post]()
    @Binding var postsViewModel: PostViewModel
    @StateObject var network = Network()
    var body: some View {
        
        GeometryReader{ metrics in
            VStack{
            HStack{
                Spacer()
                Button(action: getPosts) {
                    Text("Load from API")
                        .foregroundColor(.newWhite)
                }.buttonStyle(.borderedProminent)
                    .tint(.newPrimaryColor)
                    .controlSize(.large)
                
                
                Spacer()
                Button{removeNonFavorites()
                    
                } label:{
                    Text("Only favorites")
                        .foregroundColor(.newWhite)
                    Image(systemName: "star.fill")
                }.buttonStyle(.borderedProminent).tint(.newPrimaryColor).controlSize(.large)
                Spacer()
            }
            
                Button{removeEverything()
                    
                } label:{
                    Text("Delete Everything")
                        .foregroundColor(.newWhite)
                    Image(systemName: "trash.fill")
                }.buttonStyle(.borderedProminent).tint(.newPrimaryColor).controlSize(.large)
                Spacer()
            }
        }
        
    }
    func getPosts(){
        
            postsViewModel.getPosts { (posts) in
                self.posts = posts
            }
    }
    func removeNonFavorites(){
        if postsViewModel.favorites.count>0{
                    for p in postsViewModel.posts{
                        let _ = postsViewModel.favorites.contains { element in
                            if case p = element {
                                return true
                            } else {
                                let index = postsViewModel.posts.firstIndex(of: p)
                                if (index != nil){
                                    postsViewModel.posts.remove(at: index!)
                                }
                        return false
                    }
                }
                
            }
        }else
        {
            postsViewModel.posts.removeAll()
        }
        postsViewModel.setUserDefaults()
    }
    func removeEverything(){
        postsViewModel.posts.removeAll()
        postsViewModel.favorites.removeAll()
        postsViewModel.setUserDefaults()
    }
}




