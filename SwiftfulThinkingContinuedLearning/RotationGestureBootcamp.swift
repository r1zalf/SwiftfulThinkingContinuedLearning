//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    @State var angle: Angle = Angle(degrees: 0)
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing))
            .frame(height: 120)
            .padding(.horizontal, 40)
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        withAnimation(.spring) {
                            angle = value.rotation
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
