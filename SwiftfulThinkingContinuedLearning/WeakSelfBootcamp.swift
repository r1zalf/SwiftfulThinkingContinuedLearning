//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 29/01/24.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go to second screen") {
                SecondWeakSelfBootcamp()
            }
            .navigationTitle("Main screen")
        }
    }
}


struct SecondWeakSelfBootcamp: View {
    
    @StateObject var vm = SecondWeakSelfVM()
    
    var body: some View {
        Text(vm.name)
            .onAppear {
                vm.downloadNumber()
            }
    }
}

class SecondWeakSelfVM: ObservableObject {
    
    @Published var name = "Empty"
    
    func fetchNumber() -> String {
        return "Hallo, Rizal!"
    }
    
    func downloadNumber() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 10) { [weak self] in
            
            guard let self = self else { return }
            
            let res = self.fetchNumber()
            
            DispatchQueue.main.async {
                
                self.name = res
            }
        }
    }
    
    init() {
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(count + 1, forKey: "count")
    }
    
    deinit {
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(count - 1, forKey: "count")
    }
}

#Preview {
    WeakSelfBootcamp()
}
