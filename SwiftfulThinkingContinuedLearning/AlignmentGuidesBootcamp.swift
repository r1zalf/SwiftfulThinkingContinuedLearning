//
//  AlignmentGuidesBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 18/04/24.
//

import SwiftUI

struct AlignmentGuidesBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Hello, world!")
                    .background(.blue)
                    .offset(x: -50)
                Text("This is some other text")
                    .background(.red)
            }
            .background(.orange)
            
            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .background(.blue)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        dimension.width
                    })
                Text("This is some other text")
                    .background(.red)
            }
            .background(.orange)
            
            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .background(.blue)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        dimension.width * 0.5
                    })
                Text("This is some other text")
                    .background(.red)
            }
            .background(.orange)
            
            
            VStack (alignment: .leading, spacing: 20){
                rowItem("Row 1")
                rowItem("Row 2", showIcon: true)
                rowItem("Row 3")
            }
            .padding(.horizontal)
        }
    }
    
    
    func rowItem(_ title: String, showIcon: Bool = false) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            Text(title)
            Spacer()
        }
        .background(.red)
        .alignmentGuide(.leading) { _ in
            return  showIcon ? 40 : 0
        }
        
    }
    
}

#Preview {
    AlignmentGuidesBootcamp()
}
