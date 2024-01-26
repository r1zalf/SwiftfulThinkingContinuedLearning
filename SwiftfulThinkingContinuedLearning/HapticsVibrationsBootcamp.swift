//
//  HapticsVibrationsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI


class  HapticsVibrations {
    static let shared =  HapticsVibrations()
    
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
        
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}

struct HapticsVibrationsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("error") {
                HapticsVibrations.shared.notification(type: .error)
            }
            Button("warning") {
                HapticsVibrations.shared.notification(type: .warning)
            }
            Button("success") {
                HapticsVibrations.shared.notification(type: .success)
            }
            
            
            Button("heavy") {
                HapticsVibrations.shared.impact(style: .heavy)
            }
            Button("heavy") {
                HapticsVibrations.shared.impact(style: .heavy)
            }
            Button("medium") {
                HapticsVibrations.shared.impact(style: .medium)
            }
            Button("rigid") {
                HapticsVibrations.shared.impact(style: .rigid)
            }
        }
    }
}

#Preview {
    HapticsVibrationsBootcamp()
}
