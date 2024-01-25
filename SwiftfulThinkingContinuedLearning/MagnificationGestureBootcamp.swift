//
//  MagnificationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 24/01/24.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    @State private var scale: CGFloat = 1

      var body: some View {
          VStack {
              Circle()
                  .frame(width: 200, height: 200)
                  .foregroundColor(.blue)
                  .scaleEffect(scale) // Apply the scale transform
                  .gesture(MagnifyGesture()
                      .onChanged { value in
                          // Update the scale value as the user magnifies
                          scale = value.magnification
                      }
                      .onEnded { _ in
                          // Reset the scale value when the gesture ends
                          withAnimation(.spring()) {
                              scale = 1
                          }
                      }
                  )

              Text("Current Scale: \(scale, specifier: "%.2f")")
          }
          .padding()
      }
}

#Preview {
    MagnificationGestureBootcamp()
}
