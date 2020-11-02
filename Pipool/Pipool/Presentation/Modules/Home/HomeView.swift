//
//  HomeView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ServicesView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Services")
            }
            ProfileView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Profile")
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
