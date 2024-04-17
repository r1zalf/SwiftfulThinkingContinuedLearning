//
//  PhotoRowView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 17/04/24.
//

import SwiftUI

struct ImageLoadingView: View {
    
    @StateObject var vm: ImageLoadingViewModel
    
    init(urlImage: String) {
        _vm = StateObject(wrappedValue: ImageLoadingViewModel(urlImage: urlImage))
    }
    
    var body: some View {
        if vm.isLoading {
            ProgressView()
        } else if let image = vm.image {
            Image(uiImage: image)
                .resizable()
                .clipShape(Circle())
        }
    }
}

#Preview {
    ImageLoadingView(urlImage: "")
}
