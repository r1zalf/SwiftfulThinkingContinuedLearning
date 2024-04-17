//
//  PhotoCacheService.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 17/04/24.
//

import SwiftUI


class PhotoCacheService {
    
    static var instance = PhotoCacheService()
    
    let imageCache: NSCache<NSString, UIImage> = {
        
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100 mb
        
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        imageCache.setObject(value, forKey: NSString(string: key))
    }
    
    func get(key: String) -> UIImage? {
       return imageCache.object(forKey: NSString(string: key))
    }
}
