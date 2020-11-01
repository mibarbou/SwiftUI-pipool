//
//  PipoolApp.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 18/09/2020.
//

import SwiftUI

@main
struct PipoolApp: App {
    // swiftlint:disable weak_delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
               //perform cleanup
            }
        }
    }
}
