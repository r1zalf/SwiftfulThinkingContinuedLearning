//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating = 1
    
    var body: some View {
        starsView
            .overlay(overlayView.mask(starsView))
    }
    var overlayView: some View {
        GeometryReader { geometry in
                Rectangle()
                .fill(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
                .frame(width:  CGFloat(rating) / 5  * geometry.size.width)
            }
        .allowsHitTesting(false)
    }
    var starsView: some View {
        HStack(spacing: 10) {
            ForEach(1..<6) { index in
                Image(systemName:"star.fill")
                    .font(.largeTitle)
                    .scaledToFit()
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
