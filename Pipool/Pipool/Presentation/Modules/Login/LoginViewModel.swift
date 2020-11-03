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
            validateFields()
        }
    }
    @Published var password: String = "Wallb@x20" {
        didSet {
            validateFields()
        }
    }
    
    @Published var isTextFieldsFilled: Bool = false
    @Published var isLoading: Bool = false
    
    private var interactor: AuthenticationInteractor = AuthenticationInteractorDefault()
    
    func doLogin() {
        isLoading = true
        interactor.loginWith(email: email,
                             password: password) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success:
                self?.navigateTo = "Home"
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func validateFields() {
        isTextFieldsFilled = email.isFilled &&
                            password.isFilled &&
                            email.isValidEmail
    }
}
