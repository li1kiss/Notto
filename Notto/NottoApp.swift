//
//  NottoApp.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 17/10/2024.
//

import SwiftUI

@main
struct NottoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
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
