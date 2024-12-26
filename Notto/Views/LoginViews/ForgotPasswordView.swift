//
//  ForgotPasswordView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 27/11/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authService: AuthService
    @Environment(\.presentationMode) var presentationMode
    
    @State var userEmail: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackgroundView()
                
                logoView(geometry: geometry)
                VStack{
                    TextTitleLoginView(
                        title: "Forgot password?",
                        subtitle: "Please enter your email to receive a confirmation code to set a new password.",
                        paddingButton: geometry.size.height * 0.055
                    )
                    Spacer()
                }
                VStack(spacing: 0) {
                    Spacer()
                    
                    VStack {
                        InputFieldView(
                            textInput: $userEmail,
                            isSecure: false,
                            title: "Email", placeholder: "user@domain.com"
                        )
                        
                        // Кнопка для відправки коду підтвердження
                        NavigationLink(destination: EnterEmailCodeView<ChangePasswordView>(userEmail: $userEmail, nextView: {ChangePasswordView()})){
                            Text("Send")
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
                        .padding(.top, 24)
                        
                        Spacer()
                        
                        HStack {
                            Text("Remember password?")
                                .foregroundStyle(Color("secondaryTextColor"))
                                .font(.system(size: 15))
                            NavigationLink(destination: LoginView()){
                                Text("Sign in")
                                    .font(.system(size: 15))
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 32)
                        .padding(.bottom, 8)
                    }
                    .customBackgroundLogin(geometry: geometry, heightPercentage: 70)
                }
            
            }
            .background(Color.backgroundPrimary)
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationBarBackButtonHidden(true)
        .toolbarNavigation(title: "Forgot Password"){
            presentationMode.wrappedValue.dismiss()
        }
    }
}


extension ForgotPasswordView {
    private func logoView(geometry: GeometryProxy) -> some View {
        VStack {
            Image("envelope.shield")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.3)
                .offset(x: 90, y: -35)
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForgotPasswordView()
                .environmentObject(AuthService())
        }
    }
}
