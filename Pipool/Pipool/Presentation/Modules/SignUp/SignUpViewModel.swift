//
//  RegisterViewModel.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

class SignUpViewModel: ObservableObject, Identifiable {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    
    @Published var isFormValid: Bool = false 
    
    private var interactor: AuthenticationInteractor = AuthenticationInteractorDefault()
    
    func doSignUp() {
        
        interactor.registerWith(name: name,
                                surname: surname,
                                email: email,
                                password: password) { result in
            switch result {
            case .success:
                print("go to main")
            case .failure(let error):
                print(error)
            }
        }
    }

}
