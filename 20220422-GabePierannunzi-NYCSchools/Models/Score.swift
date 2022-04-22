
struct Score {
    
    let math: Double?
    let reading: Double?
    let writing: Double?
    
    init(_ data: ScoreData) {
        math = Double(data.satMathAvgScore)
        reading = Double(data.satCriticalReadingAvgScore)
        writing = Double(data.satCriticalReadingAvgScore)
    }
    
}
