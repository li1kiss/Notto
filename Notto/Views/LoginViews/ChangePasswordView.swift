//
//  СhangePasswordView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 29/11/2024.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var oldPasword = ""
    @State private var newPassword = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackgroundView()

                VStack {
                    imageView(geometry: geometry)
                    Spacer()
                }

                VStack(spacing: 0) {
                    titleView(geometry: geometry)
                    Spacer()
                    mainContent(geometry: geometry)
                }
            }

            .background(Color.backgroundPrimary)
            .navigationBarBackButtonHidden(true)
            
        }
        .toolbarNavigation(title: "Resert Password") {
            presentationMode.wrappedValue.dismiss()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

extension ChangePasswordView {
    private func imageView(geometry: GeometryProxy) -> some View {
        Image("shield.lock")
            .resizable()
            .scaledToFit()
            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.35)
            .offset(x: 100, y: -60)
    }
    
    private func mainContent(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            textFieldsView
            resetButtonView
            Spacer()
        }
        .customBackgroundLogin(geometry: geometry, heightPercentage: 75)
    }
    
    private func titleView(geometry: GeometryProxy) -> some View {
        TextTitleLoginView(
            title: "Create new password",
            subtitle: "Set your new password so you can login \nand access Notto.",
            paddingButton: 0
        )
    }
    
    private var textFieldsView: some View {
        VStack {
            InputFieldView(
                textInput: $oldPasword,
                isSecure: true,
                title: "New password",
                placeholder: "At least 8 symbols"
            )
            
            InputFieldView(
                textInput: $newPassword,
                isSecure: true,
                title: "Confirm password",
                placeholder: "Re-enter a new password"
            )
        }
    }
    
    private var resetButtonView: some View {
        NavigationLink(destination: SuccessResetPasswordView()) {
            Text("Reset password")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .foregroundColor(.white)
        }
        .buttonStyle(CustomButtonStyle(
            normalColorBackground: Color.unpressedColorButton,
            pressedColorBackground: Color.buttonPressed,
            normalColorForeground: .white,
            pressedColorForeground: .white)
        )
        .cornerRadius(8)
        .padding(.top, 24)
    }
}
 

struct ChangePasswordView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChangePasswordView()
                .environmentObject(AuthService())
        }
    }
}

