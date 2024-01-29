//
//  EscapingBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 29/01/24.
//

import SwiftUI


// Void -> ()
// @escaping -> async

class EscapingVM: ObservableObject {
    
    @Published var name = "Empty"
    
    init() {
        showName()
    }
    
    func showName() {
        //        name = download()
        
        //        download2 { name in
        //            self.name = name
        //        }
        
        download3 { self.name = $0 }
        
    }
    
    func download() -> String {
        return "Rizal 1"
    }
    
    func download2(handler: (_ name: String) -> ()){
        handler("Rizal 2")
    }
    
    func download3(handler: @escaping (_ name: String) -> ()){
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 5) {
            handler("Rizal 3")
        }
    }
    
}
struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingVM()
    
    var body: some View {
        Text(vm.name)
    }
}

#Preview {
    EscapingBootcamp()
}
