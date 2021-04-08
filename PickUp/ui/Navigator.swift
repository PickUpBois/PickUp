//
//  Router.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/6/21.
//

import Foundation
import SwiftUI

enum Route {
    case login
    case signup
}

struct Navigator {
    
    @ViewBuilder
    static func navigate<T: View>( route: Route, content: () -> T) -> some View {
        switch route {
        case .login:
            NavigationLink(
                destination: LoginView()) {
                content()
            }
        case .signup:
            NavigationLink(
                destination: SignUpView()) {
                content()
            }
        }
    }
}
