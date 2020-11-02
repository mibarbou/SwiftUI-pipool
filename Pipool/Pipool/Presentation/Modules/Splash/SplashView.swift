//
//  SplashView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel = SplashViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                .ignoresSafeArea()
                Text("PIPOOL")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                NavigationLink(destination: LoginView(),
                               tag: "Login",
                               selection: $viewModel.navigateTo) { EmptyView() }
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: {
            viewModel.requestUserLoginState()
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
