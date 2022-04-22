
import SwiftUI

struct SchoolsListView: View {
    
    @ObservedObject private var list = ListModel()
    
    @State private var showInfo: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)
                    List(list.schools) { school in
                        NavigationLink(destination: SchoolView(school: school)) {
                            SchoolsListItem(school: school)
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .navigationTitle("Schools")
                    .refreshable {
                        Task {
                            await list.load()
                        }
                    }
                }
            }
            InfoView(show: showInfo) {
                showInfo = false
            }
        }
        .onAppear {
            Task {
                await list.load()
            }
            
            showInfo = true
        }
        .alert("Oops, check your connection and try again", isPresented: $list.showAlert) {
            Button("Done") {
                list.showAlert = false
            }
        }
        .preferredColorScheme(.dark)
    }
    
}
