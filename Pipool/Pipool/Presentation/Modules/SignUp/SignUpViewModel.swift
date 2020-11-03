//
//  RegisterViewModel.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

class SignUpViewModel: ObservableObject, Identifiable {
    
    @Published var navigateTo: String?
    
    @Published var name: String = "" {
        didSet {
            validateFields()
        }
    }
    @Published var surname: String = "" {
        didSet {
            validateFields()
        }
    }
    @Published var email: String = "" {
        didSet {
            validateFields()
        }
    }
    @Published var password: String = "" {
        didSet {
            validateFields()
        }
    }
    @Published var repeatPassword: String = "" {
        didSet {
            validateFields()
        }
    }
    
    @Published var isFormValid: Bool = true
    @Published var isLoading: Bool = false
        
    private var interactor: AuthenticationInteractor = AuthenticationInteractorDefault()
    
    func doSignUp() {
        self.isLoading = true
        interactor.registerWith(name: name,
                                surname: surname,
                                email: email,
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

}

extension SignUpViewModel {
    
    func validateFields() {
        guard name.isFilled,
              surname.isFilled,
              email.isValidEmail,
              password.isFilled,
              password == repeatPassword else {
                isFormValid = true
                return
        }
        isFormValid = true
    }
}
