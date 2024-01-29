//
//  BackgroundThreadBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 29/01/24.
//

import SwiftUI

class BackgroundThreadManager: ObservableObject {
    
    @Published var nums = [Int]()
    
    func fetchNumber() -> [Int] {
        var nums: [Int] = []
        
        for i in 0..<100 {
            nums.append(i)
        }
        return nums
    }
    
    func downloadNumber() {
        DispatchQueue.global(qos: .background).async {
            
            let res = self.fetchNumber()
            print("Thread 1 : \(Thread.isMainThread)")
            print("Thread 1 : \(Thread.current)")
            
            DispatchQueue.main.async {
                
                self.nums = res
                print("Thread 2 : \(Thread.isMainThread)")
                print("Thread 2 : \(Thread.current)")
            }
        }
    }
    
}

struct BackgroundThreadBootcamp: View {
    @StateObject var vm = BackgroundThreadManager()
    var body: some View {
        
        VStack {
            Button("Download nums") {
                vm.downloadNumber()
            }
            List {
                ForEach(vm.nums, id: \.self) {
                    Text(String($0))
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}
