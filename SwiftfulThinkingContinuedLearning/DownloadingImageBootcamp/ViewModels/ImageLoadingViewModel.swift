//
//  ImageLoadingViewModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 17/04/24.
//

import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var image: UIImage?
    var cancellables = Set<AnyCancellable>()
    var urlImage: String
    
//    var cache = PhotoCacheService.instance
    var cache = PhotoFileManagerService.instance
    
    init(urlImage: String) {
        self.urlImage = urlImage
        getImage()
    }
    func getImage() {
        if let imageCached = cache.get(key: urlImage) {
            image = imageCached
            print("Image from cache")
        } else {
            downloadImage()
            print("Image from network")
        }
    }
    
    func downloadImage() {
       
        
        isLoading = true
        
        guard let url = URL(string: urlImage) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map { UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] imageResult in
                guard let self = self, let image = imageResult else { return }
                self.image = image
                self.cache.add(key: urlImage, value: image)
            }
            .store(in: &cancellables)
    }
    
}
