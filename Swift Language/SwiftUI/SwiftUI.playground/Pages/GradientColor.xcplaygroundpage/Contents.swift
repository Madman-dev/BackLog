import SwiftUI

// Giving Gradient
struct ContentView: View {
    var body: some View {
        Text("iOS")
            .font(.system(size: 180))
            .fontWeight(.black)
            .foregroundStyle(
                LinearGradient(
                    colors: [.green, .red, .yellow],
                    startPoint: .topTrailing,
                    endPoint: .bottom)
                )
    }
}
