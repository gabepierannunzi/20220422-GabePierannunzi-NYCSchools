
import SwiftUI

struct SchoolView: View {
    
    @ObservedObject private var model = SchoolModel()
    
    let school: School
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProgressView(number: "\(model.score?.math ?? 0)",
                             label: "Math",
                             color: Color.blue,
                             amount: (model.score?.math ?? 0) / 1600)
                Spacer()
                ProgressView(number: "\(model.score?.reading ?? 0)",
                             label: "Reading",
                             color: Color.orange,
                             amount: (model.score?.reading ?? 0) / 1600)
                Spacer()
                ProgressView(number: "\(model.score?.writing ?? 0)",
                             label: "Writing",
                             color: Color.red,
                             amount: (model.score?.writing ?? 0) / 1600)
            }
            Text(school.schoolName)
                .font(.system(size: 28, weight: .regular))
                .foregroundColor(Color.title)
                .padding(.top, 8)
                .padding(.bottom, 2)
            Text(school.primaryAddressLine1 ?? "")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.subtitle)
                .padding(.bottom, 12)
            Button("Visit Website") {
                UIApplication.shared.open(URL(string: "https://" + school.website!)!)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.button)
            .foregroundColor(Color.white)
            .font(.headline)
            .cornerRadius(12)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .onAppear {
            Task {
                await model.fetchScore(school: school)
            }
        }
        .alert("Oops, check your connection and try again", isPresented: $model.showAlert) {
            Button("Done") {
                model.showAlert = false
            }
        }
    }
}
