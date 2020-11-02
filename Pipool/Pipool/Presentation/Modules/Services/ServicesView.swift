//
//  ServicesView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        NavigationView {
            Spacer()
            Text("Services")
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
