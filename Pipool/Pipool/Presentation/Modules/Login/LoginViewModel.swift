//
//  LoginViewModel.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject, Identifiable {
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var interactor: LoginInteractor = LoginInteractorDefault()
    
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
    
}
