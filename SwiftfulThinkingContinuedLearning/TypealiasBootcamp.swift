//
//  TypealiasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 29/01/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
}

typealias EmployeeModel = UserModel

struct TypealiasBootcamp: View {
    
    let user = UserModel(name: "Rizal")
    let employee = EmployeeModel(name: "Rizal KEren")
    
    var body: some View {
        Text(user.name)
        Text(employee.name)
    }
}

#Preview {
    TypealiasBootcamp()
}
