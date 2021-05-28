//
//  PostNotificationView.swift
//  PickUp
//
//  Created by David Reynolds on 5/23/21.
//

import SwiftUI

struct PostNotificationView: View {
    var body: some View {
        VStack{
                HStack {
                    NavigationLink(destination: ProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true)) {
                    Image("serena")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 25, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text("John Cena")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        
                    }
                    Spacer()
                    Text("12/11/2020 @ 1:45 A.M.")
                    .lineLimit(1)
                    
                }
            Spacer().frame(height: 15)
                    HStack {
                        Text("Arian Rahbar liked your post")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                            .frame(width: 400, alignment: .leading)
                    }
                }
                .padding(.all, 10)
                .frame(width: 400.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(8)
    }
}

struct PostNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        PostNotificationView()
    }
}
