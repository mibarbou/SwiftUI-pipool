//
//  SplashViewModel.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

class SplashViewModel: ObservableObject, Identifiable {
    
    @Published var navigateTo: String?
    
    func requestUserLoginState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigateTo = "Login"
        }
    }
}
