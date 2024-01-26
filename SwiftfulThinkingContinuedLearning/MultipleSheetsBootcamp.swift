//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI

//1. binding
//2. single tree
//3. with item

struct RandomStruc: Identifiable {
    let id: String = UUID().uuidString
    let name: String
}
struct MultipleSheetsBootcamp: View {
    @State var randomStruc: RandomStruc? = nil
//    @State var showSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Sheet 1") {
                randomStruc = RandomStruc(name: "Sheet 1")
//                showSheet.toggle()
            }
//            .sheet(isPresented: $showSheet) {
//                SecondMultipleSheetsBootcamp(randomStruc: $randomStruc)
//            }
            Button("Sheet 2") {
                randomStruc = RandomStruc(name: "Sheet 2")
//                showSheet.toggle()
            }
//            .sheet(isPresented: $showSheet) {
//                SecondMultipleSheetsBootcamp(randomStruc: $randomStruc)
//            }
        }.sheet(item: $randomStruc) { value in
            SecondMultipleSheetsBootcamp(randomStruc: value)
        }
    }
}

struct SecondMultipleSheetsBootcamp: View {
//    @Binding var randomStruc: RandomStruc
    var randomStruc: RandomStruc
    var body: some View {
        Text(randomStruc.name)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
