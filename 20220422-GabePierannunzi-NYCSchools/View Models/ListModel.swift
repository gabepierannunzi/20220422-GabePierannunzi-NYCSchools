
import SwiftUI

class ListModel: ObservableObject {
    
    private let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
    
    @Published var schools: [School] = []
    @Published var showAlert: Bool = false
    
    func load() async {
        do {
            let schools = try await API.fetch(url: url, type: [School].self)
            
            DispatchQueue.main.async {
                self.schools = schools
            }
        } catch {
            DispatchQueue.main.async {
                // TODO: handle specific errors
                self.showAlert = true
            }
        }
    }
    
}
