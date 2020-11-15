//
//  ServicesViewModel.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 15/11/2020.
//

import SwiftUI

class ServicesViewModel: ObservableObject, Identifiable {
    
    func requestServices() {
        ApiClientDefault().services { result in
            print(result)
        }
    }
}
