//
//  FileManagerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Rizal Fahrudin on 16/04/24.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyAppImage"
    
    private init() {
        createIfNeedFolder()
    }
    
    func createIfNeedFolder() {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appending(path: folderName)
            .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error create new folder \(error.localizedDescription)")
            }
        }
        
    }
    
    func deleteFolder() {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appending(path: folderName)
            .path else {
            return
        }
        
        if FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.removeItem(atPath: path)
                print("Success delete folder")
            } catch {
                print("Error delete folder \(error.localizedDescription)")
            }
        }
    }
    
    func saveImage(image: UIImage, name: String) {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            print("erro getting data image.")
            return
        }
        
        guard let path = getPathForImage(name: name) else {
            print("error getting path image.")
            return
        }
        
        do {
            try data.write(to: path)
            print("Success Saving: \(path)")
        } catch let error {
            print(error)
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appending(path: folderName)
            .appending(path: "\(name).jpg")
        
        
        return path
    }
    
    func getImage(name: String) -> UIImage? {
        guard let path = getPathForImage(name: name)?.path, FileManager.default.fileExists(atPath: path) else {
            print("Error getting path image.")
            return nil
        }
        print("Success get image")
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String){
        guard let path = getPathForImage(name: name)?.path, FileManager.default.fileExists(atPath: path) else {
            print("Error getting path image.")
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success delete image")
        } catch let error {
            print("Error delete image \(error)")
        }
    }
}

class FileManagerViewModel: ObservableObject {
    
    let fm = LocalFileManager.instance
    
    @Published var image: UIImage?
    
    init() {
        image = .twice
        //        image = fm.getImage(name: "twice-img")
        
        
    }
    
    func saveImage() {
        guard let image else { return }
        fm.saveImage(image: image, name: "twice-img")
    }
    
    func deleteImage() {
        fm.deleteImage(name: "twice-img")
        
        // delete folder too
        fm.deleteFolder()
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
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
                    Button("Save to FM") {
                        vm.saveImage()
                    }
                    .tint(.white)
                    .padding(.all)
                    .background(
                        Color.blue
                    )
                    .clipShape(.rect(cornerRadius: 12))
                    
                    Button("Delete from FM") {
                        vm.deleteImage()
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
            .navigationTitle("Twice.")
        }
        
    }
}

#Preview {
    FileManagerBootcamp()
}
