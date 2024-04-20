//
//  ScrollViewPagingBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 18/04/24.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    
    @State var position: Int? = nil
    
    var body: some View {
        VStack {
            Button("Go to") {
                withAnimation(.bouncy) {
                    position = (0..<20).randomElement()
                }
            }
            .padding(.top, 100)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<20) { i in
                            Rectangle()
                            .frame(width: 300, height: 300)
                            .clipShape(.rect(cornerRadius: 12))
                            .overlay {
                                Text("\(i)")
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .containerRelativeFrame(.vertical, alignment: .center)
                            .id(i)
                            .scrollTransition(.interactive.threshold(.visible(0.9))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(y: phase.isIdentity ? 0 : -100)
                            }
                    }
                }
            }
            .background(.gray)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $position)
        }
    }
    
    //    var body: some View {
    //        ScrollView {
    //            VStack(spacing: 0) {
    //                ForEach(0..<20) { i in
    //                        Rectangle()
    //                        .overlay {
    //                            Text("\(i)")
    //                                .foregroundStyle(.white)
    //                        }
    //
    //                        .containerRelativeFrame(.vertical, alignment: .center)
    //                }
    //            }
    //        }
    //        .ignoresSafeArea()
    //        .scrollTargetLayout()
    //        .scrollTargetBehavior(.paging)
    //        .scrollBounceBehavior(.basedOnSize)
    //        .scrollPosition(id: $position)
    //    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
