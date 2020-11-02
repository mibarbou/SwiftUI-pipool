//
//  LoginViewModel.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject, Identifiable {
    @Published var navigateTo: String?
    
    @Published var email: String = "mibarbou@gmail.com" {
        didSet {
            validatedFields()
        }
    }
    @Published var password: String = "Wallb@x20" {
        didSet {
            validatedFields()
        }
    }
    
    @Published var isTextFieldsFilled: Bool = false
    
    private var interactor: AuthenticationInteractor = AuthenticationInteractorDefault()
    
    func doLogin() {
        interactor.loginWith(email: email,
                             password: password) { result in
            switch result {
            case .success:
                self.navigateTo = "Home"
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func validatedFields() {
        isTextFieldsFilled = email.isFilled && password.isFilled
    }
    
}
