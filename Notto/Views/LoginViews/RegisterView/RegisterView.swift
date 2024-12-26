//
//  RegisterView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 03/11/2024.
//
//
//  RegisterView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 03/11/2024.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Properties
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var registrationSuccess = false
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackgroundView()
                logoView
                logOutButton
                sloganView
                formView(geometry: geometry)
                footerView
            }
            .background(Color.backgroundPrimary)
            .onAppear {
                resetFields()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}






// MARK: - Subviews
extension RegisterView {
    
    private var logoView: some View {
        VStack {
            Image("wheel")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.56, height: UIScreen.main.bounds.height * 0.3)
                .offset(x: 110)
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    private var logOutButton: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: LoginView()){
                    Text("Log out")
                        .foregroundStyle(.white)
                        .font(.system(size: 17))
                }
                .padding(.top, 8)
                .padding(.horizontal, 17)
            }
            Spacer()
        }
    }
    
    private var sloganView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image("appLogo")
            Text("Your car in one app.")
                .font(.system(size: 17))
                .foregroundStyle(Color.subtitleColorSet.opacity(0.75))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(.vertical, UIScreen.main.bounds.height * 0.03)
        .padding(.horizontal, 24)
    }
    
    private func formView(geometry: GeometryProxy) -> some View {
        VStack {
            Spacer()
            ScrollView{
                VStack(spacing: 0) {
                    inputFields
                    continueButton
                    
                }
            }
            .frame(maxHeight: geometry.size.height * (geometry.safeAreaInsets.bottom > 40 ? 1 : 0.76))
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .background(Color.backgroundPrimary)
            .cornerRadius(16, corners: [.topLeft, .topRight])
            .scrollIndicators(.hidden)
        }
}

    private var inputFields: some View {
        VStack(spacing: 16) {
            InputFieldView(textInput: $firstName, isSecure: false, title: "First Name", placeholder: "Enter your first name")
            InputFieldView(textInput: $lastName, isSecure: false, title: "Last Name", placeholder: "Enter your last name")
            InputFieldView(textInput: $email, isSecure: false, title: "Email", placeholder: "your@email.com")
            InputFieldView(textInput: $password, isSecure: true, title: "Password", placeholder: "At least 8 symbols")
        }
    }

    private var continueButton: some View {
        NavigationLink(destination: EnterEmailCodeView<SuccessRegisterView>(userEmail: $email, nextView: {SuccessRegisterView()})){
                Text("Continue")
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

    private var footerView: some View {
        VStack {
            Spacer()
            Text(makeAttributedString())
                .frame(maxWidth: 250)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.vertical, 8)
                .foregroundStyle(Color("secondaryTextColor"))
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - Helper Methods
extension RegisterView {
    private func resetFields() {
        email = ""
        password = ""
    }

    private func makeAttributedString() -> AttributedString {
        var attributedString = AttributedString("By registering, you accept our Terms of Use and Privacy Policy.")

        if let termsRange = attributedString.range(of: "Terms of Use") {
            attributedString[termsRange].foregroundColor = .blue
            attributedString[termsRange].link = URL(string: "https://example.com/terms")
        }

        if let policyRange = attributedString.range(of: "Privacy Policy") {
            attributedString[policyRange].foregroundColor = .blue
            attributedString[policyRange].link = URL(string: "https://example.com/privacy")
        }

        return attributedString
    }
}

// MARK: - Preview
#Preview {
    RegisterView()
}
