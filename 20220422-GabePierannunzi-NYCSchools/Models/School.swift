
import Foundation

// if I had access, I would work with whoever is responsible for the API to model the data based on what data we can guarantee the schema will have

struct School: Codable {
    let dbn: String
    let schoolName: String
    let location: String?
    let primaryAddressLine1: String?
    let overviewParagraph: String?
    let phoneNumber: String?
    let schoolEmail: String?
    let website: String?
}

extension School: Identifiable {
    var id: UUID { UUID() }
}
