//
//  VisualEffectBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 18/04/24.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    
    @State var showSpacer = false
    
//    var body: some View {
//        VStack {
//            Text("Learn to use the VisualEffect ViewModifier in SwiftUI for adding blur and vibrancy effects to your app interfaces")
//                .background(.gray)
//                .visualEffect { content, geometryProxy in
//                    content.grayscale(geometryProxy.frame(in: .global).minY < 300 ? 1 : 0)
//                }
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.bouncy, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
//    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .visualEffect { content, geometryProxy in
                            content.offset(x: geometryProxy.frame(in: .global).minY * 0.5)
                        }
                }
                
            }
        }
    }
}

#Preview {
    VisualEffectBootcamp()
}
