//
//  LoginView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 22/10/2024.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @EnvironmentObject var authService: AuthService
    
    @State private var username = ""
    @State private var password = ""
    
    
    var body: some View {
        
        GeometryReader{ geometry in
            NavigationView{
                
                ZStack{
                    BackgroundView()
                    
                    logoView(geometry: geometry)
                    
                    loginForm(geometry: geometry)
                    
                }
                .background(Color.backgroundPrimary)
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .onAppear{
                    username = ""
                    password = ""
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
                    .environmentObject(AuthService())
    }
}


struct CustomBackgroundModifier: ViewModifier {
    var geometry: GeometryProxy
    var heightPercentage: CGFloat // Новий параметр

    func body(content: Content) -> some View {
        content
            .frame(maxHeight: geometry.size.height * (heightPercentage / 100))
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .background(Color.backgroundPrimary)
            .cornerRadius(16, corners: [.topLeft, .topRight])
    }
}


extension View {
    func customBackgroundLogin(geometry: GeometryProxy, heightPercentage: CGFloat) -> some View {
        self.modifier(CustomBackgroundModifier(geometry: geometry, heightPercentage: heightPercentage))
    }
}



struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension LoginView {
    
    private func logoView(geometry: GeometryProxy) -> some View {
        VStack {
            Image("wheel")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.56, height: UIScreen.main.bounds.height * 0.3)
                .offset(x: 110)
            Spacer()
        }
        }
    
    private func loginForm(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0){
            TextTitleLoginView(
                            title: "Log in to your account",
                            subtitle: "Control your car in smartphone.",
                            paddingButton: geometry.size.height * 0.07
                        )
            Spacer()
            VStack(spacing: 0) {
                
                VStack(spacing: 16) {
                    // Input Fields
                    InputFieldView(textInput: $username, isSecure: false, title: "Email", placeholder: "your@email.com")
                    InputFieldView(textInput: $password, isSecure: true, title: "Password", placeholder: "At least 8 symbols")
                }
                
                // Sign In Button
                Button {
                    authService.login(username: username, password: password)
                    UIApplication.shared.hideKeyboard()
                } label: {
                    Text("Sign In")
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
                
                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot password?")
                        .padding(.top, geometry.size.height * 0.042)
                }
                Spacer()
                
                NavigationLink(destination: RegisterView()) {
                    Text("Get started")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                }
                .buttonStyle(CustomButtonStyle(
                    normalColorBackground: .unpressedColorCreateButton,
                    pressedColorBackground: Color.buttonPressed.opacity(0.1),
                    normalColorForeground: Color.unpressedTextButton,
                    pressedColorForeground: .white)
                )
                .cornerRadius(8)
                .padding(.bottom, 8)
            }
            .frame(maxHeight: geometry.size.height * 0.72)
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .background(Color.backgroundPrimary)
            .cornerRadius(16, corners: [.topLeft, .topRight])
        }
    }
}
