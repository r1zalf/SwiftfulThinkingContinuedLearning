//
//  ArrayMethodBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI



struct ArrayMethodBootcamp: View {
    struct CustomModel: Identifiable{
        let id: String = UUID().uuidString
        let name: String
        let followers: Int
        var isVerified: Bool = false
    }
    
    let users = [
        CustomModel(name: "Jokowi", followers: 1200, isVerified: true),
        CustomModel(name: "Anies", followers: 300, isVerified: true),
        CustomModel(name: "Rizal", followers: 120),
        CustomModel(name: "Prabowo", followers: 500),
        CustomModel(name: "Rizal", followers: 120, isVerified: true),
        CustomModel(name: "Kucink", followers: 50),
        CustomModel(name: "Trump", followers: 6020, isVerified: true),
        CustomModel(name: "Ellon", followers: 7010, isVerified: true),
    ]
    
//    var newUser: [CustomModel] = []
    
    var names: [String] = []
    init() {
        
        //sort
        //        newUser = users.sorted{ $1.followers > $0.followers}
        
        //filter
//        newUser = users.filter { $0.isVerified }
        
        names = users
            .filter { $0.isVerified }
            .sorted { $1.followers > $0.followers }
            .map { $0.name }
        
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(names, id: \.self) {
                Text($0)
            }
            
//            ForEach(newUser) { user in
//                HStack {
//                    Text(user.name)
//                    Spacer()
//                    Text(String(user.followers))
//                    Spacer()
//                    Text(user.isVerified ? "Verif" : "No")
//                }
//            }
        }.padding()
    }
}

#Preview {
    ArrayMethodBootcamp()
}
