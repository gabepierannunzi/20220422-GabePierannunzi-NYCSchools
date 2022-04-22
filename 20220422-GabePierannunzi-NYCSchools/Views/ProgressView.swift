
import SwiftUI

struct ProgressView: View {
    
    let number: String
    let label: String
    let color: Color
    let amount: Double
    
    @State var complete: Double = 0.0
    @State private var progress: CGFloat = 0.0
    
    private let strokeStyle = StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round)
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(style: strokeStyle)
                    .opacity(0.2)
                    .foregroundColor(color)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: strokeStyle)
                    .opacity(complete)
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270))
                Text("\(number)")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(Color.title)
            }
            .frame(width: 96, height: 96)
            Text(label)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.subtitle)
                .padding(.top, 8)
        }
        .onChange(of: amount) { newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                withAnimation(Animations.standard) {
                    progress = newValue
                    complete = 1.0
                }
            }
        }
    }
}
