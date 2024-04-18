//
//  AccessibilityColorView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 17/04/24.
//

import SwiftUI

struct AccessibilityColorView: View {
    @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency
//    @Environment(\.colorSchemeContrast) var colorSchemeContrast
//    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
//    @Environment(\.accessibilityInvertColors) var accessibilityInvertColors
    
    var body: some View {
        VStack {
            Button("Button 1") {
            }
            .buttonStyle(.borderedProminent)
            
            Button("Button 2") {
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            Button("Button 3") {
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            
            Button("Button 4") {
            }
            .buttonStyle(.borderedProminent)
            .tint(accessibilityReduceTransparency ? .brown : .black)
        }
        .font(.largeTitle)
    }
}

#Preview {
    AccessibilityColorView()
}
