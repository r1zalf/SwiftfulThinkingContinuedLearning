//
//  PhotoViewModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 16/04/24.
//

import Foundation
import Combine

class PhotoViewModel: ObservableObject {
    
    let service = PhotoDataService.instance
    
    @Published var photos: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        service.$photos.sink { [weak self] photoResult in
            self?.photos = photoResult
        }
        .store(in: &cancellables)
        
    }
}
