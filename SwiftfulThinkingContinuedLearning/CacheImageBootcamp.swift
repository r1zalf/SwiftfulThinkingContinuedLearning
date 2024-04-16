//
//  CacheImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Rizal Fahrudin on 16/04/24.
//

import SwiftUI


class CacheManager {
    static let instance = CacheManager()
    
    init() {
        
    }
    
    var imageCache: NSCache<NSString, UIImage> =  {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100 mb
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: NSString(string: name))
        print("Success add image to cache")
    }
    
    func delete(name: String) {
        imageCache.removeObject(forKey: NSString(string: name))
        print("Success delete image from cache")
    }
    
    func get(name: String) -> UIImage? {
        print("Success get image from cache")
       return imageCache.object(forKey: NSString(string: name))
    }
}

class CacheManagerViewModel: ObservableObject {
    
    let fm = CacheManager.instance
    
    @Published var image: UIImage?
    @Published var cachedImage: UIImage?
    init() {
        image = .twice
        getImageCache()
    }
    
    func saveImage() {
        guard let image else { return }
        fm.add(image: image, name: "twice-img")
    }
    
    func deleteImage() {
        fm.delete(name: "twice-img")
    }
    
    func getImageCache() {
        cachedImage = fm.get(name: "twice-img")
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
                        vm.deleteImage()
                    }
                    .tint(.white)
                    .padding(.all)
                    .background(
                        Color.red
                    )
                    .clipShape(.rect(cornerRadius: 12))
                }
                Button("Get from cache") {
                    vm.getImageCache()
                }
                .tint(.white)
                .padding(.all)
                .background(
                    Color.green
                )
                .clipShape(.rect(cornerRadius: 12))
                
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipped()
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
