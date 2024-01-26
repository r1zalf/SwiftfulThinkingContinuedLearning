//
//  DragBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI

struct DragBootcamp: View {
    @State var size: CGSize = .zero
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing))
            .frame(width: 120, height: 120)
            .offset(size)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.spring) {
                            size = value.translation
                        }
                    }
                    .onEnded { valueLast in
                        withAnimation(.bouncy) {
                            size = .zero
                        }
                    }
            )
    }
}

#Preview {
    DragBootcamp()
}
