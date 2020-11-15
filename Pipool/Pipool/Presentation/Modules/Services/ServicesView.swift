//
//  ServicesView.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import SwiftUI

struct ServicesView: View {
    
    @ObservedObject var viewModel: ServicesViewModel = ServicesViewModel()
    
    var body: some View {
        NavigationView {
            Spacer()
            Text("Services")
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            viewModel.requestServices()
        })
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
