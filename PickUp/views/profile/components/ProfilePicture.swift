//
//  ProfilePicture.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/1/21.
//

import SwiftUI
import SDWebImageSwiftUI

extension ProfilePicture {
    enum ActionType {
        case photoSource
        case upload
    }
}
//=======
//struct ProfilePicture: View {
//    var photoUrl: String?
//    init(photoUrl: String?) {
//        self.photoUrl = photoUrl
//    }
//    var body: some View {
//        WebImage(url: URL(string: photoUrl ?? ""))
//            .resizable()
//            .placeholder(Image("serena")
//                            .resizable()
//                            )
//            .indicator(.activity)
//            .frame(width: 100, height: 100, alignment: .center)
//            .clipShape(Circle())
//            .shadow(radius: 2)
//             .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
//            .padding(.trailing, 20)
//>>>>>>> backend-loading-ui
//    }
//}


struct ProfilePicture: View {
    @ObservedObject var viewModel: ProfilePictureViewModel
    @State var showPhotoLibrary = false
    @State var photoSource: UIImagePickerController.SourceType = .photoLibrary
    @State var actionType: ActionType? = nil
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var photoSourceActionSheet: ActionSheet {
        ActionSheet(title: Text("Photo Source"), message: Text("Select photo source"), buttons: [
            .default(Text("Photo Library")) {
                photoSource = .photoLibrary
                actionType = nil
                showPhotoLibrary = true
            },
            .default(Text("Camera")) {
                photoSource = .camera
                actionType = nil
                showPhotoLibrary = true
            },
            .cancel() {actionType = nil}
        ])
    }
    
    var uploadActionSheet: ActionSheet {
        ActionSheet(title: Text("Upload Image"), message: Text("Set this image as your new profile picture?"), buttons: [
            .default(Text("Upload")) {
                viewModel.uploadPhoto()
                actionType = nil
            },
            .cancel() { actionType = nil}
        ])
    }
    
    var body: some View {
        let showActionSheet: Binding<Bool> = .init(get: {self.actionType != nil}, set: {_ in })
        Group {
            if viewModel.loading {
                ProgressView()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(.trailing, 20)
            } else {
                Button(action: {
                    actionType = .photoSource
                }) {
                    if viewModel.photoUrl != nil {
                        WebImage(url: URL(string: viewModel.photoUrl ?? ""))
                            .resizable()
                            .placeholder {
                                    Rectangle().foregroundColor(.gray)
                                }
                            .indicator(.activity)
                            .frame(width: 100, height: 100, alignment: .center)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                            .padding(.trailing, 20)
                    } else {
                        Image("placeholder")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                            .padding(.trailing, 20)
                    }
                }
            }
        }
        .actionSheet(isPresented: showActionSheet) {
            switch actionType! {
            case .photoSource:
                return photoSourceActionSheet
            case .upload:
                return uploadActionSheet
            }
        }
        .sheet(isPresented: self.$showPhotoLibrary, onDismiss: {
            if self.viewModel.selectedImage != nil {
                self.actionType = .upload
            }
        }) {
            ImagePicker(sourceType: photoSource, selectedImage: self.$viewModel.selectedImage)
            }
        
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture(viewModel: MockProfilePictureViewModel(photoUrl: nil)).environmentObject(MockProfileViewModel(userId: ""))
    }
}
