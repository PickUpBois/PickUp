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
    init(sourceType: UIImagePickerController.SourceType = .photoLibrary, userId: String) {
        self.sourceType = sourceType
        self.userId = userId
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
                    let path = "profilePictures/\(AppState.shared.authId!).jpg"
                    Services.shared.storage.upload(file: data, path: path).sink(receiveCompletion: { completion in
                        switch completion {
                        case .failure(let error):
                            print(error)
                        case .finished:
                            self.parent.presentationMode.wrappedValue.dismiss()
                        }
                    }, receiveValue: { downloadUrl in
                        Services.shared.apollo.perform(mutation: UpdateUserMutation(input: UpdateUserInput(id: AppState.shared.authId!, photoUrl: downloadUrl))) { response in
                            switch response {
                            case .success(let result):
                                if let errors = result.errors {
                                    print(errors[0].localizedDescription)
                                }
                                self.parent.presentationMode.wrappedValue.dismiss()
                            case .failure(let error):
                                print(error.localizedDescription)
                                self.parent.presentationMode.wrappedValue.dismiss()
                            }
                            
                        }}).store(in: &self.parent.cancellables)
                } catch(let error) {
                    self.parent.presentationMode.wrappedValue.dismiss()
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
