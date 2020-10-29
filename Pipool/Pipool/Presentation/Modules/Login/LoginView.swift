//
//  LoginView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

struct LoginView: View {
    @State var email: String
    @State var password: String
    
    var body: some View {
        VStack {
            TextField("email", text: $email).padding()
            TextField("password", text: $password).padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView(email: "mibarbou@gmail.com",
                      password: "123456")
        }
    }
}
