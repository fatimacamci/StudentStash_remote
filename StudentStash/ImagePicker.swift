//
//  ImagePicker.swift
//  StudentStash
//
//  Created by Fatima Camci on 7/26/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isVisible:Bool
    
    func makeCoordinator () -> Coordinator {
    Coordinator(isVisible: $isVisible)
    }
    
    func makeUIViewController (context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        vc.delegate = context.coordinator
        
        return vc
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate
    {
        @Binding var isVisible:Bool
        
        init (isVisible: Binding<Bool>) {
        _isVisible = isVisible
        }
        func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        isVisible = false
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isVisible = false
        }
    }
    
}

