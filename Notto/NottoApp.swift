//
//  NottoApp.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 17/10/2024.
//

import SwiftUI

@main
struct NottoApp: App {
    
    @StateObject private var tabState = TabState()
    @StateObject var appViewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            ZStack {
                if appViewModel.isLoggedIn {
              
                        MainTabView()
                            .environmentObject(appViewModel)
                            .environmentObject(tabState)
                } else {
                    LoginView()
                        .environmentObject(appViewModel)
                }
            }
            .animatableBlur(radius: appViewModel.showBlur ? 40 : 0)
            .animation(.easeInOut(duration: 3), value: appViewModel.showBlur)
        }
    }
}



struct AnimatableBlurModifier: AnimatableModifier {
    var radius: CGFloat

    var animatableData: CGFloat {
        get { radius }
        set { radius = newValue }
    }

    func body(content: Content) -> some View {
        content.blur(radius: radius)
    }
}

extension View {
    func animatableBlur(radius: CGFloat) -> some View {
        self.modifier(AnimatableBlurModifier(radius: radius))
    }
}
