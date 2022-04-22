
import SwiftUI

struct InfoView: View {
    
    var show: Bool
    var onAction: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("🏫")
                    .font(.system(size: 40, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .scaleEffect(show ? 1 : 0.5)
                    .animation(Animations.pop, value: show)
                Text("Welcome!")
                    .padding(4)
                    .font(.system(size: 28, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .offset(y: show ? 0 : 8)
                    .opacity(show ? 1 : 0)
                    .animation(Animations.present.delay(0.4), value: show)
                    
                Text("Search for a school to view scores")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color.subtitle)
                    .multilineTextAlignment(.center)
                    .opacity(show ? 1 : 0)
                    .animation(Animations.present.delay(0.7), value: show)
                Spacer()
                Button("Get Started") {
                    onAction()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.button)
                .foregroundColor(Color.white)
                .font(.system(size: 17, weight: .bold))
                .cornerRadius(12)
                .padding(.top, 16)
                .padding(.horizontal, 20)
                .opacity(show ? 1 : 0)
                .animation(Animations.present.delay(0.8), value: show)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .opacity(show ? 1.0 : 0.0)
        .animation(Animations.standard, value: show)
        .allowsHitTesting(show)
    }
    
}
