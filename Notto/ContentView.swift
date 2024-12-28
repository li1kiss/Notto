//
//  ContentView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 28/11/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authService = AuthService()
    @StateObject private var appState = AppState()
    
    var body: some View {
        ZStack {
            if(authService.isLoggedIn){
                MainTabView()
                    .environmentObject(authService)
                    .environmentObject(appState)
            }else{
                LoginView()
                    .environmentObject(authService)
                    .environmentObject(appState)
            }
        }
        .animatableBlur(radius: authService.showBlur ? 40 : 0)
        .animation(.easeInOut(duration: 3), value: authService.showBlur)
    }
}
