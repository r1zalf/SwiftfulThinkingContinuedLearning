//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI


struct HashableBootcamp: View {
//    struct CustomModel: Identifiable {
//        var id: String {
//            title
//        }
//        let title: String
//    }
//    
    struct CustomModel: Hashable {
        let title: String
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(title)
        }
    }
    
    
    let models: [CustomModel] = [
        CustomModel(title: "One"),
        CustomModel(title: "Two"),
        CustomModel(title: "three"),
        CustomModel(title: "For"),
        CustomModel(title: "Five"),
        CustomModel(title: "One"),
        CustomModel(title: "Two"),
    ]
    
    var body: some View {
        VStack {
//            ForEach(models) { value in
//                Text(value.title)
//            }
            
            ForEach(models, id: \.self) { value in
                Text(value.title)
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
