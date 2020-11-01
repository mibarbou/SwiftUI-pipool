//
//  SplashView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.blue
            .ignoresSafeArea()
            Text("PIPOOL")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
