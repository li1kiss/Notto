//
//  QuickActionsView .swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct QuickActionsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 4){
            HStack(alignment: .center, spacing: 4) {
                
                
                Button {
                    //
                } label: {
                    ActionButton(title: "Payment", iconName: "arrowshape.up")
                }
                
                
                
                Button {
                    //
                } label: {
                    ActionButton(title: "Income", iconName: "arrowshape.down")
                }
                
            }
            HStack(alignment: .center, spacing: 4) {
                Button {
                    //
                } label: {
                    ActionButton(title: "Fuelling", iconName: "fuelpump")
                }
                Button {
                    //
                } label: {
                    ActionButton(title: "Service", iconName: "wrench.and.screwdriver")
                }
            }
        }
    }
}

struct ActionButton: View {
    var title: String
    var iconName: String
    
    var body: some View {
        
        Button(action: {
            print("button pressed")
        }) {
            HStack(spacing: 4){
                // Subheadline/Regular
                Image(systemName: iconName)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                // Subheadline/Regular
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .buttonStyle(CustomButtonStyle(normalColorBackground: Color.unpressedColorButton, pressedColorBackground: Color.buttonPressed, normalColorForeground: .white, pressedColorForeground: .white))
        .cornerRadius(8)
        }
}

struct CustomButtonStyle: ButtonStyle {
    var normalColorBackground: Color
    var pressedColorBackground: Color
    var normalColorForeground: Color
    var pressedColorForeground: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? pressedColorBackground : normalColorBackground) // Фон змінюється залежно від стану
            .foregroundStyle(configuration.isPressed ? pressedColorForeground : normalColorForeground)
//            .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.5), value: configuration.isPressed) // Анімація натискання
    }
}

#Preview {
    QuickActionsView()
}
