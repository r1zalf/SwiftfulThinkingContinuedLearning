//
//  CombineBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 29/01/24.
//

import SwiftUI
import Combine

struct CombineBootcamp: View {
    
    class PostVM: ObservableObject {
        
        @Published var posts = [PostModel]()
        
        var cancelables = Set<AnyCancellable>()
        
        init() {
            fetchPosts()
        }
        
        func fetchPosts() {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
            
            URLSession.shared.dataTaskPublisher(for: url)
                .subscribe(on: DispatchQueue.global(qos: .background))
                .receive(on: DispatchQueue.main)
                .tryMap(handleOutput)
                .decode(type: [PostModel].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .sink { posts in
                    self.posts = posts
                }
                .store(in: &cancelables)
        }
        
        func handleOutput(output: Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> Data {
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            return output.data
        }
    }
    
    @StateObject var vm = PostVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.posts) { post in
                    VStack(spacing: 12) {
                        Text(post.title)
                            .lineLimit(2)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("With Combine")
        }
    }
}

#Preview {
    CombineBootcamp()
}
