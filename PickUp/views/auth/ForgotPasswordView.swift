//
//  ForgotPasswordView.swift
//  PickUp
//
//  Created by David Reynolds on 7/22/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack (alignment: .center) {
            Spacer()
        Text("Please Enter Your Email")
            .foregroundColor(Color("Text"))
            .font(.system(size: 20, weight: .medium))
            
        HStack {
            //Hstack Email
            Image(systemName: "envelope")
                .foregroundColor(.black)
            TextField("Email", text: $viewModel.email)
        }
        //Email Text Field Settings
        .padding(.all, 15.0)
        .frame(width: 380)
        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
        .cornerRadius(8)
        .padding(.horizontal, 20)
            
        Button(action: viewModel.login){
            Text("Send Link")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
                .frame(width: 380)
                }
                .padding(.vertical, 10)
                .background(Color.blue.opacity(0.8))
                .cornerRadius(9)
                .padding(.horizontal, 20)
            
            Spacer()
        }
        
        Spacer().frame(height: 100)

    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
