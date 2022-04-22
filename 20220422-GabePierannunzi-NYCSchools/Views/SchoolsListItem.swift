
import SwiftUI

struct SchoolsListItem: View {
    
    let school: School
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(school.schoolName)
                .font(.headline)
                .foregroundColor(Color.title)
            Text(school.primaryAddressLine1 ?? "")
                .font(.subheadline)
                .foregroundColor(Color.subtitle)
        }
        .padding(.vertical, 8)
    }
}
