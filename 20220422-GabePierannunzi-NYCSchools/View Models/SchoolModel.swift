
import SwiftUI

class SchoolModel: ObservableObject {
    
    private let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
    
    @Published var score: Score?
    @Published var showAlert: Bool = false
    
    private var scores: [String: Score]?
    
    // really this is specific to this particular api. since we can only pull every school at once, we can just cache them after we have it
    
    func fetchScore(school: School) async {
        do {
            if scores == nil {
                let scoreData = try await API.fetch(url: url, type: [ScoreData].self)
                scores = scoreData.reduce(into: [String: Score]()) { $0[$1.dbn] = Score($1) }
            }
            
            DispatchQueue.main.async {
                self.score = self.scores?[school.dbn]
            }
        } catch {
            DispatchQueue.main.async {
                self.showAlert = true
            }
        }
    }
    
}
