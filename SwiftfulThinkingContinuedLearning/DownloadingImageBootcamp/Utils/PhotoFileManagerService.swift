//
//  PhotoFileManagerService.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 17/04/24.
//

import SwiftUI


class PhotoFileManagerService {
    static let instance = PhotoFileManagerService()
    let folderName = "MyAppImagePhoto"
    
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
    
    func getPathForImage(name: String) -> URL? {
        let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appending(path: folderName)
            .appending(path: "\(name).jpg")
        
        
        return path
    }
    
    func add(key: String, value: UIImage) {
        guard let data = value.jpegData(compressionQuality: 1.0) else {
            print("erro getting data image.")
            return
        }
        
        let newKey = key.split(separator: "/").last ?? "new"
        
        guard let path = getPathForImage(name: String(newKey)) else {
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
    
    
    func get(key: String) -> UIImage? {
        
        let newKey = key.split(separator: "/").last ?? "new"
        
        guard let path = getPathForImage(name: String(newKey))?.path, FileManager.default.fileExists(atPath: path) else {
            print("Error getting path image.")
            return nil
        }
        print("Success get image")
        return UIImage(contentsOfFile: path)
    }
}
