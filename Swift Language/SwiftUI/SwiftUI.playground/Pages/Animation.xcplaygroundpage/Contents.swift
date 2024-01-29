//: [Previous](@previous)

import SwiftUI

struct ContentView: View {
    
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }.padding(40)
    }
}

#Preview {
    ContentView()
}

//: [Next](@next)
