//
//  ProfilePicture.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/1/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfilePicture: View {
    var photoUrl: String?
    init(photoUrl: String?) {
        self.photoUrl = photoUrl
    }
    var body: some View {
        WebImage(url: URL(string: photoUrl ?? ""))
            .resizable()
            .placeholder(Image("serena")
                            .resizable()
                            )
            .indicator(.activity)
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
            .shadow(radius: 2)
            .overlay(Circle().stroke(Color.black, lineWidth: 5))
            .padding(.trailing, 20)
    }
}

extension ProfilePicture {
    class ViewModel {
        
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture(photoUrl: nil)
    }
}
