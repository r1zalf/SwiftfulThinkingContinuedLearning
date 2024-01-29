//
//  JSONApiCodeableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 29/01/24.
//

import SwiftUI


struct PostModel: Codable, Identifiable {
    var id: Int {
        userId
    }
    let userId: Int
    let title: String
    let body: String
}

struct JSONApiCodeableBootcamp: View {
    
    class PostVM: ObservableObject {
       
       @Published var posts = [PostModel]()
       
       init() {
           fetchPosts()
       }
       
       func fetchPosts() {
           guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
           
           downloadData(url: url) { data in
               if let data = data {
                   do {
                       let res = try JSONDecoder().decode([PostModel].self, from: data)
                      
                       DispatchQueue.main.async {
                           self.posts = res
                       }
                       
                   } catch {
                       print("Error \(error.localizedDescription)")
                   }
               } else {
                   print("Error Load data")
               }
           }
       }
       
       func downloadData(url: URL, handler: @escaping (_ data: Data?) -> ()) {
           URLSession.shared.dataTask(with: url) { data, response , error in
               
               guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 ,error == nil  else {
                   handler(nil)
                   return
               }
               handler(data)
               
           }.resume()
           
       }
   }

    @StateObject var vm = PostVM()
    
    var body: some View {
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
    }
}

#Preview {
    JSONApiCodeableBootcamp()
}
