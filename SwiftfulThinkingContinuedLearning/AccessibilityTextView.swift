//
//  AccessibilityTextView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 17/04/24.
//

import SwiftUI

struct AccessibilityTextView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<1) { _ in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "lasso")
                            Text("Lorem Ipsum")
                                .font(.title)
                            Text("Fixed")
                                .font(.system(size: 24))
                        }
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry and more recently with desktop publishing ")
                            .font(.subheadline)
                            .lineLimit(3)
                            .minimumScaleFactor(dynamicTypeSize.customMinimumScaleFactor)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}
extension DynamicTypeSize {
    var customMinimumScaleFactor: CGFloat {
        switch self {
        case .xSmall,.small,.medium:
            return 1
        case .large, .xLarge, .xxLarge,.xxxLarge:
            return 0.75
        default:
            return 0.4
        }
    }
}

#Preview {
    AccessibilityTextView()
}
