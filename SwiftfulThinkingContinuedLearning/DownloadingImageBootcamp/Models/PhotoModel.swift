//
//  PhotoModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 16/04/24.
//

import Foundation


struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}


