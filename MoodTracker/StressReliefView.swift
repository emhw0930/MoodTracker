import SwiftUI
import AVFoundation

struct StressReliefView: View {
    @State private var count = 0
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0.0
    @State private var soundPlayer: AVAudioPlayer?
    
    private let emojis = ["🤪", "😝", "🤡", "😜", "🥳"]
    @State private var currentEmojiIndex = 0
    
    init() {
        // Initialize sound player
        if let soundURL = Bundle.main.url(forResource: "pop", withExtension: "wav") {
            do {
                _soundPlayer = State(initialValue: try AVAudioPlayer(contentsOf: soundURL))
                soundPlayer?.prepareToPlay()
            } catch {
                print("Error loading sound: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.gray)
                .padding()
            
            Button(action: {
                count += 1
                withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                    scale = 1.3
                    rotation += 360
                    currentEmojiIndex = (currentEmojiIndex + 1) % emojis.count
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                        scale = 1.0
                    }
                }
                // Play sound with error handling
                if let player = soundPlayer {
                    if player.isPlaying {
                        player.currentTime = 0
                    }
                    player.play()
                }
            }) {
                Text(emojis[currentEmojiIndex])
                    .font(.system(size: 100))
            }
            .scaleEffect(scale)
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            
            Text("Tap to destress!")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 20)
        }
        .navigationTitle("Stress Relief")
    }
}

#Preview {
    NavigationView {
        StressReliefView()
    }
} 