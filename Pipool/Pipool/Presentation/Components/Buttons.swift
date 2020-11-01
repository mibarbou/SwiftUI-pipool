//
//  Buttons.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import SwiftUI

struct PipoolButton: View {
    var text: String
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                Text(text)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                Spacer()
            }
            .background(Color.blue)
            .cornerRadius(10)
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        PipoolButton(text: "Login") {}
    }
}
