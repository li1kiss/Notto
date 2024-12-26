//
//  Extention.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 27/11/2024.
//

import Foundation
import SwiftUI


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    func toolbarNavigation(title: String, onBack: @escaping () -> Void) -> some View {
            self
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(title)
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: onBack) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
        }
    
    func animatableBlur(radius: CGFloat) -> some View {
        self.modifier(AnimatableBlurModifier(radius: radius))
    }
}


extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
