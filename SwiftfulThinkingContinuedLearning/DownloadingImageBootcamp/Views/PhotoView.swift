//
//  PhotoView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 16/04/24.
//

import SwiftUI

struct PhotoView: View {
    
    @StateObject var vm = PhotoViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.photos) { photoModel in
                    PhotoItemRowView(photoModel: photoModel)
                }
            }
            .listStyle(.plain)
            .navigationTitle("List")
        }
    }
}

#Preview {
    PhotoView()
}
