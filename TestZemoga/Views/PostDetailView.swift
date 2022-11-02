

import SwiftUI

struct PostDetailView: View {
    @Binding var postsViewModel: PostViewModel
    @State var star = "star"
    @State var isFav = false
    @State var user = User( id:0,name: "a", username: "aa", email: "aa2", address: Address(street: "aaaaa", suite: "aaaaa", city: "aaaaaaaa", zipcode: "aaaaaaaaaa"), phone: "aaaaa", website: "aaaaaa", company: Company(name: "aaaaaaaaaaa", catchPhrase: "vgubhinjomkl", bs: "fvghbjnk"))
    @State var comments = [Comment]()
    @StateObject var network : Network
    var post: Post
    var body: some View {
        GeometryReader{metrics in
            VStack(alignment: .leading){
                
                HStack{
                    Spacer()
                    Text("Title: ").fontWeight(.bold).foregroundColor(.newPrimaryColor)
                    Text(post.title)
                    Spacer()
                    Button {
                        
                        if isFav{
                            let index = postsViewModel.favorites.firstIndex(of: post)
                            postsViewModel.favorites.remove(at: index!)
                            isFav=false
                        }else{
                            postsViewModel.favorites.append(post)
                            
                            isFav=true
                        }
                        
                        postsViewModel.setUserDefaults()
                    } label: {
                        Image(systemName: star).foregroundColor(.newPrimaryColor)
                    }
                    Spacer()
                }.padding(.horizontal)
                Divider().frame(width:metrics.size.width)
                HStack{
                    Spacer()

                    Text("Body: ").fontWeight(.bold).foregroundColor(.newPrimaryColor)
                    Text(post.body)
                    Spacer()

                }.padding(.horizontal)
                
                Divider()
                Text("User Information").foregroundColor(.newPrimaryColor).fontWeight(.bold).padding(.horizontal)
                HStack{
                    
                    VStack(alignment: .leading){
                        Text(user.name)
                        Text(user.username)
                        Text(user.email)
                        let address = user.address.street + " " + user.address.suite
                        Text(address)
                        Text(user.address.city + " " + user.address.zipcode)
                        Text(user.phone)
                        Text(user.website)
                        Text(user.company.name )
                        Text(user.company.catchPhrase)
                        Text(user.company.bs)
                        
                    }.padding(.horizontal)
                    
                }
                Divider()
                Text("Comments").foregroundColor(.newPrimaryColor).fontWeight(.bold)
                List(comments){ comment in
                    
                    VStack(alignment: .leading){
                        
                        Text(comment.name).fontWeight(.bold)
                        Text(comment.email).fontWeight(.bold)
                       
                        Text(comment.body)
                    }
                  
                }
                
                Spacer()

                
                
            }.onAppear{
                getUser(userid: post.userId)
                getComments(postId: post.id)
                checkFav()
            }
               
                
        }.navigationBarTitle("Post Detail", displayMode: .inline).navigationBarItems(trailing: Button{
            let index = postsViewModel.posts.firstIndex(of: post)
            postsViewModel.posts.remove(at: index!)
            guard let index = postsViewModel.favorites.firstIndex(of: post) else {return}
            postsViewModel.favorites.remove(at: index)
        } label: {
            Image(systemName: "trash.fill")
        })
    }
    func getUser(userid:Int){
        PostViewModel().getDetail(userid: userid){user in
            self.user = user
        }
    }
    func getComments(postId:Int){
        PostViewModel().getComments(postId: postId){(comments) in
            self.comments = comments
        }
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



