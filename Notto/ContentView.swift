//
//  ContentView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 28/11/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authService = AuthService()
    @StateObject private var tabState = TabState()
    @State var userEmail: String = ""
    
    var body: some View {
        ZStack {
            if(authService.isLoggedIn){
                MainTabView()
                    .environmentObject(authService)
                    .environmentObject(tabState)
            }else{
                LoginView()
                    .environmentObject(authService)
            }
        }
        .animatableBlur(radius: authService.showBlur ? 40 : 0)
        .animation(.easeInOut(duration: 3), value: authService.showBlur)
    }
}
