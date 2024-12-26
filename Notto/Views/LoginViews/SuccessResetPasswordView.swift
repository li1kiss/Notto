//
//  SuccessResetPasswordView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 28/11/2024.
//

import SwiftUI

struct SuccessResetPasswordView: View {
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                BackgroundView()
                imageView(geometry: geometry)
                VStack {
                    titleView(geometry: geometry)
                    Spacer()
                    VStack {
                        
                        sendButton
                        Spacer()
                    }
                    .customBackgroundLogin(geometry: geometry, heightPercentage: 45)
                }
            }
        }
        .background(Color.backgroundPrimary)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    
        SuccessResetPasswordView()
            .environmentObject(AuthService())
    
}


extension SuccessResetPasswordView {
    private var finishedLoginButton: some View{
        VStack{
            Button{
//                navigationPath = NavigationPath()
            }label:{
                Text("Back to Login")
                    .frame(maxWidth: .infinity)
            }
            
        }
    }
    
    private var sendButton: some View {
        NavigationLink(destination: LoginView()){
            Text("Back to login")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .foregroundColor(.white)
        }
        .buttonStyle(
            CustomButtonStyle(
                normalColorBackground: Color.unpressedColorButton,
                pressedColorBackground: Color.buttonPressed,
                normalColorForeground: .white,
                pressedColorForeground: .white
            )
        )
        .cornerRadius(8)
    }
    
    private func titleView(geometry: GeometryProxy) -> some View {
                TextTitleLoginView(title: "Password changed", subtitle: "Your password has been changed successfully.", paddingButton: 140)
    }
    
    private func imageView(geometry: GeometryProxy) -> some View {
        Image("shield.check")
            .resizable()
            .scaledToFit()
            .frame(width: geometry.size.width * 0.5 ,height:  geometry.size.height * 0.35)
            .offset(x: 100, y: -130)
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
}


