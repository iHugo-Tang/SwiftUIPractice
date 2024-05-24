import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State var isFliped = false
    
    var body: some View {
        ZStack {
            Card(text: "Back", color: .red)
                .rotation3DEffect(.degrees(isFliped ? 0 : -90), axis: (x: 0, y: 1, z: 0))
                .animation(isFliped ? .linear.delay(0.35) : .linear, value: isFliped)
            Card(text: "Front", color: .blue)
                .rotation3DEffect(.degrees(isFliped ? 90 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(isFliped ? .linear : .linear.delay(0.35), value: isFliped)
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.7)) {
                isFliped.toggle()
            }
        }
    }
}

struct Card: View {
    var text: String
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 300)
                .foregroundColor(color)
            Text(text)
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
