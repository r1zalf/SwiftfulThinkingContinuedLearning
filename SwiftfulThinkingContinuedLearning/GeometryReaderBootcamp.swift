//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    func getPercentage(_ geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).minX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { _ in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing))
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geometry) * 50) ,axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}
