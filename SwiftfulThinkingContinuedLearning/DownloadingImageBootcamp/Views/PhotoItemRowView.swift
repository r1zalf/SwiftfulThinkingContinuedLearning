//
//  PhotoItemRowView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 17/04/24.
//

import SwiftUI

struct PhotoItemRowView: View {
    var photoModel: PhotoModel
    
    var body: some View {
        HStack {
            ImageLoadingView(urlImage: photoModel.url)
            .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(photoModel.title)
                    .font(.title2)
                    .bold()
                Text(photoModel.thumbnailUrl)
                    .font(.title3)
                
            }
        }
    }
}

#Preview {
    PhotoItemRowView(photoModel: PhotoModel(albumId: 1, id: 1, title: "Example", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
}
