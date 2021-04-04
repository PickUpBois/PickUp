//
//  SignUpView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/3/21.
//

import SwiftUI
import OSLog

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        print(email)
        print(password)
        return NavigationView {
            Form {
                TextField("Email address", text: $email)
                TextField("Password", text: $password)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
