//
//  LoginViewModel.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject, Identifiable {
    @Published var email: String = "" {
        didSet {
            validatedFields()
        }
    }
    @Published var password: String = "" {
        didSet {
            validatedFields()
        }
    }
    
    @Published var isTextFieldsFilled: Bool = false
    
    private var interactor: AuthenticatorInteractor = AuthenticatorInteractorDefault()
    
    func doLogin() {
        interactor.loginWith(email: email,
                             password: password) { result in
            switch result {
            case .success:
                print("go to main")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func validatedFields() {
        isTextFieldsFilled = email.isFilled && password.isFilled
    }
    
}
