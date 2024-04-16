//
//  CacheImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Rizal Fahrudin on 16/04/24.
//

import SwiftUI


class CacheManagerViewModel: ObservableObject {
    
    let fm = LocalFileManager.instance
    
    @Published var image: UIImage?
    
    init() {
        image = .twice
    }
    
    func saveImage() {
        guard let image else { return }
        fm.saveImage(image: image, name: image.description)
    }
}

struct CacheImageBootcamp: View {
    
    @StateObject var vm = CacheManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipped()
                        .clipShape(.rect(cornerRadius: 12))
                }
                
                HStack {
                    Button("Save to cache") {
                        vm.saveImage()
                    }
                    .tint(.white)
                    .padding(.all)
                    .background(
                        Color.blue
                    )
                    .clipShape(.rect(cornerRadius: 12))
                    Button("Delete from cache") {
                        vm.saveImage()
                    }
                    .tint(.white)
                    .padding(.all)
                    .background(
                        Color.red
                    )
                    .clipShape(.rect(cornerRadius: 12))
                }
                
                Spacer()
               
            }
            .navigationTitle("Twice")
        }
       
    }
}
#Preview {
    CacheImageBootcamp()
}
