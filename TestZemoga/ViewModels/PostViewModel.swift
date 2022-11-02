

import Foundation
import Network

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var favorites = [Post]()
    let user = User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: ""), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
    let comments = [Comment]()
    var userDefaults = UserDefaults()
    let monitor = NWPathMonitor()
    
    func getPosts(completion:@escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { [self] (data, _, _) in
            if data != nil {
                posts = try! JSONDecoder().decode([Post].self, from: data!)
            }
            userDefaults.set(data, forKey: "posts")
            DispatchQueue.main.async { [self] in
                completion(posts)
            }
        }
        .resume()
        
    }
    
    func getDetail(userid: Int,completion:@escaping (User) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userid)") else { return }
        URLSession.shared.dataTask(with: url) { [self] (data, _, _) in
            if data != nil {
                let user = try! JSONDecoder().decode(User.self, from: data!)
            }
            
            
            DispatchQueue.main.async {
                completion(self.user)
            }
        }
        .resume()
    }
    
    func getComments (postId:Int, completion:@escaping ([Comment]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments") else { return }
        
        URLSession.shared.dataTask(with: url) { [self] (data, _, _) in
            if data != nil {
                let comments = try! JSONDecoder().decode([Comment].self, from: data!)
            }
            
            
            DispatchQueue.main.async { [self] in
                completion(comments)
            }
        }
        .resume()
    }
    
    func setUserDefaults(){
        userDefaults.set(try! JSONEncoder().encode(posts), forKey: "posts")
        userDefaults.set(try! JSONEncoder().encode(favorites), forKey: "favorites")
    }
    func loadUserDefaults(){
        if userDefaults.object(forKey: "posts") != nil {
            self.posts =  try! JSONDecoder().decode([Post].self, from: userDefaults.object(forKey: "posts") as! Data )
        }
            if userDefaults.object(forKey: "favorites") != nil{
                self.favorites = try! JSONDecoder().decode([Post].self, from: userDefaults.object(forKey: "favorites") as! Data )
            }
            

    }
}



