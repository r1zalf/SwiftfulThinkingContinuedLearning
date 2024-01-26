//
//  SoundEffectsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI
import AVKit

class SoundEffectsManager {
    
    static let share = SoundEffectsManager()
    
    var player: AVAudioPlayer?
    
    func play(_ sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {
            print("Error get url sound")
            
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    enum SoundOption: String {
        case tadaSound = "tada"
        case badumSound = "badum"
    }
}

struct SoundEffectsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Sound tada") {
                SoundEffectsManager.share.play(.tadaSound)
            }
            
            Button("Sound badum") {
                SoundEffectsManager.share.play(.badumSound)
            }
        }
    }
}

#Preview {
    SoundEffectsBootcamp()
}
