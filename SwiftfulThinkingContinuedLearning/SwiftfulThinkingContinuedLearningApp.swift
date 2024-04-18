//
//  SwiftfulThinkingContinuedLearningApp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 24/01/24.
//

import SwiftUI

@main
struct SwiftfulThinkingContinuedLearningApp: App {
    
    @AppStorage("count") var count: Int = 0
    
    init() {
        count = 0
    }
    
    var body: some Scene {
        WindowGroup {
//            WeakSelfBootcamp()
//                .overlay(alignment: .topTrailing) {
//                    Text("\(count)")
//                        .padding()
//                        .background(.green)
//                        .padding()
//                }
            
            AccessibilityColorView()
        }
    }
}
