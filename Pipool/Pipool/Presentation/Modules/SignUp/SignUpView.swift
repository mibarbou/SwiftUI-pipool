//
//  RegisterView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                PlaceholderTextField(placeholder: Text("name"),
                                     text: $viewModel.name).padding()
                PlaceholderTextField(placeholder: Text("surname"),
                                     text: $viewModel.surname).padding()
                PlaceholderTextField(placeholder: Text("email"),
                                     text: $viewModel.email).padding()
                SecurePlaceholderTextField(placeholder: Text("password"),
                                           text: $viewModel.password).padding()
                SecurePlaceholderTextField(placeholder: Text("repeat password"),
                                           text: $viewModel.repeatPassword).padding()
                Spacer()
                ProgressView().visibility(hidden: .constant(!viewModel.isLoading))
                PipoolButton(text: "Sign up",
                             action: viewModel.doSignUp)
                .padding()
                    .disabled(!viewModel.isFormValid && !viewModel.isLoading)
                NavigationLink(destination: HomeView(),
                               tag: "Home",
                               selection: $viewModel.navigateTo) { EmptyView() }
            }
            .padding()
            .gesture(
                TapGesture()
                    .onEnded({ _ in
//                        self.hideKeyboard()
                }))
        }
        .navigationBarTitle("Sign up", displayMode: .inline)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
