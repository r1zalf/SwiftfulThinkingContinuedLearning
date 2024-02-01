//
//  SubscriberBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 30/01/24.
//

import SwiftUI
import Combine

class SubscriberVM: ObservableObject {
    
    @Published var count = 0
    @Published var name = ""
    
    @Published var isNameValid = false
    @Published var isButtonDisabled = true
    
    //    var cancel: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        startTimer()
        addTextFieldnNameSubscriber()
        addButtonSubscriber()
    }
    
    func addButtonSubscriber() {
        $isNameValid.combineLatest($count)
            .sink { [weak self] nameValid, count in
                guard let self = self else { return }
                self.isButtonDisabled = !(nameValid && count >= 10)
            }.store(in: &cancellables)
    }
    
    
    func addTextFieldnNameSubscriber() {
        $name.sink { [weak self] value in
            guard let self = self else { return }
            self.isNameValid = value.count >= 3
        }
        .store(in: &cancellables)
    }
    
    func startTimer() {
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] value in
                guard let self = self else { return }
                self.count += 1
                //                if self.count == 10 { self.cancel?.cancel() }
                
            }
            .store(in: &cancellables)
    }
}
struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberVM()
    
    var body: some View {
        
        VStack {
            Text(String(vm.count))
                .font(.system(size: 100))
            
            TextField("Input name", text: $vm.name)
                .padding()
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(alignment: .trailing) {
                    
                    if vm.isNameValid {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .font(.title.weight(.medium))
                            .padding()
                    } else {
                        if vm.name.count != 0 {
                            Image(systemName: "xmark")
                                .foregroundStyle(.red)
                                .font(.title.weight(.medium))
                                .padding()
                        }
                    }
                }
            
            Button("Login") {
                
            }
            .buttonStyle(.borderedProminent)
            .disabled(vm.isButtonDisabled)
            
        
        }.padding()
    }
}

#Preview {
    SubscriberBootcamp()
}
