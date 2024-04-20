//
//  AccessibilityVoiceOverBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 18/04/24.
//

import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    
    @State var isON = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Settings") {
                    Toggle("Volume", isOn: $isON)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isON ? "ON" : "OFF")
                    }
                    .onTapGesture {
                        isON.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(isON ? "is ON" : "is OFF")
                    .accessibilityHint("Double tap to toggle settings.")
                    .accessibilityAction {
                        isON.toggle()
                    }
                    
                    
                }
                Section("Application") {
                    
                    Text("Favorites")
                    
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                        .accessibilityLabel("Favorites")
                    
                    Button("Favorites") {
                    }
                    .accessibilityRemoveTraits(.isButton)
                }
                
                Section("Content") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { x in
                                Image(.twice)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaledToFill()
                                    .onTapGesture {
                                        
                                    }
                                    .accessibilityElement(children: .combine)
                                    .accessibilityAddTraits(.isButton)
                                    .accessibilityLabel("Item \(x) Image of twice")
                                    .accessibilityHint("Double tap to open")
                                    .accessibilityAction {
                                        
                                    }
                            }
                            
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
