//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 24/01/24.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var colorProgress: Color = .green
    @State var isSuccess = false
    @State var isComplete = false
    var body: some View {
        VStack(spacing: 10) {
            
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 60)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            Text("On Press")
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { isPressing in
                    if isPressing {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isComplete = true
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if !isSuccess {
                                withAnimation(.easeInOut) {
                                    isComplete = false
                                }
                            }
                        }
                    }
                    
                } perform: {
                    withAnimation(.easeInOut) {
                        isSuccess = true
                    }
                }
            
            Text("Reset")
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .onTapGesture {
                    isSuccess = false
                    isComplete = false
                }
        }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
