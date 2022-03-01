//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by coden0w on 1/3/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    
    // MARK: - Variables
    
    private let imageURL: String  = "https://credo.academy/credo-academy@3x.png"
    private let imageScale: CGFloat = 3.0
    private let imagePadding: CGFloat = 40.0
    
    var body: some View {
        
        // MARK: - 1. Basic
        
//        AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. Scale
        
//        AsyncImage(url: URL(string: imageURL), scale: imageScale)
        
        // MARK: - 3. PlaceHolder
        
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//        }
//        .padding(imagePadding)
        
        // MARK: - 4. PHASE
        
//        AsyncImage(url: URL(string: imageURL)) { phase  in
//            // Success: The image successfully loaded.
//            // Failure: The image failed to load with an error
//            // Empty: No image is loaded.
//
//
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(imagePadding)
        
        // MARK: - 5. ANIMATION
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(imagePadding)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
