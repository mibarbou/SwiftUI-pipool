//
//  LoginView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            PlaceholderTextField(placeholder: Text("email"),
                                 text: $viewModel.email)
                .padding()
            SecurePlaceholderTextField(placeholder: Text("password"),
                                       text: $viewModel.password)
                .padding()
            PipoolButton(text: "Login",
                         action: viewModel.doLogin)
                .padding()
                .disabled(!viewModel.isTextFieldsFilled)
            Spacer()
        }.padding().gesture(
            TapGesture()
                .onEnded({ _ in
                    self.hideKeyboard()
            }))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
