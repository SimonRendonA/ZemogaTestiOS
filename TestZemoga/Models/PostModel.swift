import Foundation

struct Post: Codable, Identifiable, Equatable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
    

}
