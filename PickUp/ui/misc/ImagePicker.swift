//
//  ImagePickerr.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/27/21.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct ImagePicker: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
 
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Environment(\.presentationMode) private var presentationMode
    var cancellables = Set<AnyCancellable>()
    var userId: String
    private var updateProfilePicUseCase: IUpdateProfilePicByImage
    init(sourceType: UIImagePickerController.SourceType = .photoLibrary, userId: String, useCase: IUpdateProfilePicByImage = UpdateProfilePicByImage()) {
        self.updateProfilePicUseCase = useCase
        self.sourceType = sourceType
        self.userId = userId
        self.updateProfilePicUseCase = useCase
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let imageUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                do {
                    let data = try Data(contentsOf: imageUrl)
                    self.parent.updateProfilePicUseCase.execute(image: data, userId: self.parent.userId)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .failure(let error):
                                self.parent.presentationMode.wrappedValue.dismiss()
                                print("failure")
                            case .finished:
                                print("success")
                                self.parent.presentationMode.wrappedValue.dismiss()
                            }
                        }, receiveValue: { downloadUrl in
                            print(downloadUrl)
                        }).store(in: &self.parent.cancellables)
                } catch(let error) {
                    print(error.localizedDescription)
                }
            }
     
        }
    }
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
 
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
 
        return imagePicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
 
    }
}
