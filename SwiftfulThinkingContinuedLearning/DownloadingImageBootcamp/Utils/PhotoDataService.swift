//
//  PhotoDataService.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 16/04/24.
//

import Foundation
import Combine

class PhotoDataService {
    
    static let instance = PhotoDataService()
    var cancellables = Set<AnyCancellable>()
    @Published var photos: [PhotoModel] = []
    
    init() {
        fetchPhotos()
    }
    
   func fetchPhotos() {
       guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
       
       URLSession.shared.dataTaskPublisher(for: url)
           .subscribe(on: DispatchQueue.global(qos: .background))
           .tryMap(handleOutput)
           .decode(type: [PhotoModel].self, decoder: JSONDecoder())
           .receive(on: DispatchQueue.main)
           .sink { completion in
               switch completion {
               case .finished:
                   print("success")
               case .failure(let error):
                   print("ERROR: \(error)")
               }
           } receiveValue: { [weak self] photoModelsResult in
               self?.photos = photoModelsResult
           }
           .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
