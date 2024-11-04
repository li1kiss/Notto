//
//  NottoApp.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 17/10/2024.
//

import SwiftUI

@main
struct NottoApp: App {
    
    @StateObject var appViewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            if appViewModel.isLoggedIn {
                ContentView()
                    .environmentObject(appViewModel)
            } else {
                LoginView()
                    .environmentObject(appViewModel)
            }
        }
    }
}
