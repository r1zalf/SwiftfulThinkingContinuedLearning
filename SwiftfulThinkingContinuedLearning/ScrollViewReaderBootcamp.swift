//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldText = "0"
    @State var scrollIndex: Int = 0
    var body: some View {
        VStack {
            TextField("Input no", text: $textFieldText)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .padding()
            
            Button("GO!") {
                if let validNumber = Int(textFieldText) {
                    scrollIndex = validNumber
                }
            }
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<100) {
                        Text("\($0)")
                            .frame(maxWidth: .infinity ,alignment: .center)
                            .frame(height: 200)
                            .background(.red)
                            .padding()
                            .id($0)
                    }
                    .onChange(of: scrollIndex) { oldValue, newValue in
                        proxy.scrollTo(newValue, anchor: .top)
                    }
                }
               
                
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
