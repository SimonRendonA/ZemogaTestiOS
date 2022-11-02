
import SwiftUI
import Network

@main
struct TestZemogaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
extension Color {
    
    static let newPrimaryColor = Color("primaryColor")
    static let newWhite = Color("newWhite")
    static let newBlack = Color("newBlack")
}

class Network: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool = false
    func checkConnection() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                    self.connected = true
            } else {
                    self.connected = false
            }
        }
        monitor.start(queue: queue)
    }
}
